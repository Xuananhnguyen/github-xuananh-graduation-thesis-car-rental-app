//
//  HandleResponse.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 11/08/2023.
//

import Foundation
import Alamofire

func handleResponse(response: DataResponse<Any, AFError>) {
    switch response.result {
    case .success:
        debugPrint()
        debugPrint("----------------------RESPONSE---------------------------------")
        debugPrint("Url:", response.response?.url ?? "")
        debugPrint("Status Code:", response.response?.statusCode ?? "")
        debugPrint("Content Type:", response.response?.headers["Content-Type"] ?? "")
        debugPrint("Response Body:", response.result)
        debugPrint("----------------------------------------------------------------")
        debugPrint()
    case .failure:
        logError(response: response)
    }
}

private func logError(response: DataResponse<Any, AFError>) {
    if let data = response.data {
        let json = String(data: data, encoding: String.Encoding.utf8)
        debugPrint()
        debugPrint("-------------------------ERROR---------------------------------")
        debugPrint("Url:", response.response?.url ?? "")
        debugPrint("Status Code:", response.response?.statusCode ?? "")
        debugPrint("Content Type:", response.response?.headers["Content-Type"] ?? "")
        debugPrint("Message:", json ?? "")
        debugPrint("----------------------------------------------------------------")
        debugPrint()
    } else {
        debugPrint()
        debugPrint("---------------------------ERROR--------------------------------")
        debugPrint("Url:", response.response?.url ?? "")
        debugPrint("Status Code:", response.response?.statusCode ?? "")
        debugPrint("Content Type:", response.response?.headers["Content-Type"] ?? "")
        debugPrint("Message:", "No Message")
        debugPrint("----------------------------------------------------------------")
        debugPrint()
    }
}

func logRequest(_ url: String, params: Parameters?, headers: HTTPHeaders?) {
    debugPrint()
    debugPrint("---------------------------REQUEST--------------------------------")
    debugPrint("Url:", url)
    debugPrint("Header:", headers ?? "No Headers")
    debugPrint("Params", params ?? "No Params")
    debugPrint("----------------------------------------------------------------")
    debugPrint()
}
