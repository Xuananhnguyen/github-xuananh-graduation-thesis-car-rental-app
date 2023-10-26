//
//  ConnectServer.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 02/10/2023.
//

import Foundation
import Alamofire

protocol CarRentalAppResponse: Codable {
    var message: String? { get }
    var code: Int? { get }
}

struct CarRentalBaseResponse: CarRentalAppResponse {
    var message: String?
    var code: Int?
}

class ClientNetwork: ObservableObject {
    private let errorMess: String = "Chúng tôi rất tiếc, nhưng đã xảy ra lỗi. Vui lòng thử lại sau."
    static let shared = ClientNetwork()
    private init() {}
    private let baseUrl = Configs.BASE_URL
    private let modifier: Session.RequestModifier = {
        $0.timeoutInterval = 60
        $0.cachePolicy = .reloadIgnoringCacheData
    }
    
    private func request<T: Codable>(
        headers: HTTPHeaders = getHeaders(),
        params: [String: Any] = getParams(),
        endPoint: String,
        parsingType: T.Type,
        httpMethod: HTTPMethod,
        encoding: URLEncoding = URLEncoding.default,
        successBlock: @escaping(T) -> Void,
        failBlock: @escaping(BaseError) -> Void
    ) {
        if(!Utils.checkNetWorkConnection()) {
            failBlock(.networkError)
            return
        }
    
        let request = AF.request(
            getUrl(url: endPoint),
            method: httpMethod,
            parameters: params,
            encoding: encoding,
            headers: headers,
            requestModifier: modifier
        ).responseJSON(completionHandler: handleResponse)
        
        request.cURLDescription { description in
            print(description)
        }
        
        request
            .validate(statusCode: 200..<300)
            .responseData { response in
                switch response.result {
                case .success:
                    if let dataResponse = response.data?.dataToModel(parsingType: T.self) {
                        successBlock(dataResponse)
                        return
                    }
                    
                    if let defaultResponse = response.data?.dataToModel(parsingType: CarRentalBaseResponse.self) {
                        failBlock(.parseObjectError(object: .init(code: defaultResponse.code)))
                        return
                    }
                    failBlock(.unknowError(errorMess: response.error?.errorDescription ?? ""))
                    
                case .failure(let error):
                    if error.isTimeout {
                        failBlock(.requestTimeout)
                    } else {
                        failBlock(.internalServer(statusCode: response.response?.statusCode ?? 503,
                                                  errorMess: error.errorDescription ?? "Internal Server"))
                    }
                }
            }
    }
}

extension ClientNetwork {
    
    func sendRequest<T: CarRentalAppResponse> (
        headers: HTTPHeaders = getHeaders(),
        params: [String: Any] = getParams(),
        endPoint: String,
        parsingType: T.Type,
        httpMethod: HTTPMethod,
        encoding: URLEncoding = URLEncoding.default,
        successBlock: @escaping (T) -> Void,
        failBlock: @escaping (BaseError) -> Void) {
            
            request(headers: headers,
                    params: params,
                    endPoint: endPoint,
                    parsingType: parsingType,
                    httpMethod: httpMethod,
                    encoding: encoding
            ) { response in
                guard let _ = response.code else {
                    failBlock(.unknowError(errorMess: self.errorMess))
                    print("[DEBUG]: Không có code")
                    LoadingViewModel.share.onShowProgress(isShow: false)
                    return
                }
                successBlock(response)
            } failBlock: { baseError in
                switch baseError {
                case BaseError.networkError:
                    //
                    print("[DEBUG]: lỗi internet")
                    break
                default:
                    //
                    PopupHelper.presentPopup(alertView: BaseAlertBuilder(message: self.errorMess,
                                                                         onPress: {
                        PopupHelper.dismiss()
                    }))
                    print("[DEBUG]: \(self.errorMess)")
                }
                failBlock(baseError)
            }
        }
    
    func getUrl(url: String) -> String {
        if (url.contains("http") || url.contains("https")) {
            return url
        }
        return self.baseUrl.appending(url)
    }
}

extension AFError {
    var isTimeout: Bool {
        if isSessionTaskError,
           let error = underlyingError as NSError?,
           error.code == NSURLErrorTimedOut //-1001
        {
            return true
        }
        return false
    }
}
