//
//  NetworkClient.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 25/02/2023.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

let API_URL = "http://api/"

enum ApiPath: String {
    case login = "/login/"
    case logout = "/logout/"
    
    case register = "/user/register/"
    case car_search = "/car/search/"
    case car_product = "/car/product/"
    case car_category = "/car/category/"
    case car_detail = "/car/detail/"
    case car_rental = "/car/rental/"
    case get_location = "/user/location/"
    case user_payment = "/user/payment/"
    
    case edit_user_information = "/user/information/edit/"
    case update_user_information = "/user/information/update/"
    case get_password = "/user/password/"
    case update_password = "/user/password/update/"
    
    case get_notification = "/get/notification/"
}

enum StatusCode: Int {
    case OK = 200
    case NO_CONTENT = 204
}

public class NetworkClient {
    static var instance = NetworkClient()
    
    func requestObject<T: Mappable>(path: String, method: HTTPMethod, params: Parameters?, type: T.Type, completedHandler: @escaping (T?, String?) -> Void) {
        let url = "\(API_URL)\(path)"
        Alamofire.request(url,
                          method: HTTPMethod.post,
                          parameters: params,
                          encoding: JSONEncoding.default,
                          headers: [:]).responseObject(keyPath: "")  { (response: DataResponse<T>) in
            switch response.result {
            case .success:
                if let statusCode = response.response?.statusCode, statusCode == StatusCode.OK.rawValue {
                    completedHandler(response.result.value, nil)
                    return
                }
                completedHandler(nil, "Error")
            case .failure(let error):
                completedHandler(nil, error.localizedDescription)
            }
        }
    }
     
    func requestArray<T: Mappable>(path: String,
                                   method: HTTPMethod,
                                   params: Parameters?,
                                   type: T.Type,
                                   completedHandler: @escaping ([T]?, String?) -> Void) {
        let url = "\(API_URL)\(path)"
        Alamofire.request(url,
                          method: method,
                          parameters: params,
                          encoding: JSONEncoding.default,
                          headers: [:]).responseArray(keyPath: "")  { (response: DataResponse<[T]>) in
            switch response.result {
            case .success:
                if let statusCode = response.response?.statusCode, statusCode == StatusCode.OK.rawValue {
                    completedHandler(response.result.value, nil)
                    return
                }
                completedHandler(nil, "Error")
            case .failure(let error):
                completedHandler(nil, error.localizedDescription)
            }
        }
    }
}
