//
//  AuthServices.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 03/10/2023.
//

import Foundation
import SwiftUI

class AuthServices: NSObject {
    static let shared = AuthServices()
    func login(email: String,
               password: String,
               successBlock: @escaping (LoginResponse) -> Void,
               failBlock: @escaping (BaseError) -> Void) {
        let params: [String : Any] = ["email": email,
                                      "password": password]
        ClientNetwork.shared.sendRequest(params: getParams(dict: params),
                                         endPoint: AuthEndPoint.login,
                                         parsingType: LoginResponse.self,
                                         httpMethod: .post) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
}
