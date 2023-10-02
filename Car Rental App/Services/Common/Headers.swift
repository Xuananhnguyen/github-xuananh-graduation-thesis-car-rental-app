//
//  Headers.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 02/10/2023.
//

import Foundation
import Alamofire
import UIKit

func getHeaders(encryptedPin: String = "", isWithoutAuthorization: Bool = false, isUsingAppVersion: Bool = false) -> HTTPHeaders {
    let deviceID = KeyChain.load(key: KEY_CHAIN.DEVICE_ID)?.dataToString() ?? ""
    if deviceID.isEmpty {
        let deviceID = UIDevice.current.identifierForVendor!.uuidString
        KeyChain.save(key: KEY_CHAIN.DEVICE_ID, data: Data(deviceID.utf8))
    }
    
    let headers: HTTPHeaders = [
        "Content-Type" : "application/json",
        "deviceId": deviceID,
    ]

    return headers
}

func getParams(dict: [String: Any] = [:]) -> [String: Any] {
    var params: [String: Any] = [:]
    params.merge(dict: dict)
    return params
}
