//
//  AuthServices.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 03/10/2023.
//

import Foundation

class AuthServices: NSObject {
    static let shared = AuthServices()
    
    func signIn(email: String,
               password: String,
               successBlock: @escaping (LoginResponse) -> Void,
               failBlock: @escaping (BaseError) -> Void) {
        let params: [String : Any] = ["email": email,
                                      "password": password]
        ClientNetwork.shared.sendRequest(params: getParams(dict: params),
                                         endPoint: AuthEndPoint.signIn,
                                         parsingType: LoginResponse.self,
                                         httpMethod: .post) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
    
    func signUp(fullName: String,
                email: String,
                password: String,
                phoneNumber: String,
                address: String,
                successBlock: @escaping (RegisterRespone) -> Void,
                failBlock: @escaping (BaseError) -> Void) {
        let params: [String : Any] = ["name": fullName,
                                      "email": email,
                                      "password": password,
                                      "phone_number": phoneNumber,
                                      "address": address]
        ClientNetwork.shared.sendRequest(params: getParams(dict: params),
                                         endPoint: AuthEndPoint.signUp,
                                         parsingType: RegisterRespone.self,
                                         httpMethod: .post) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
    
    func forgotPassword(email: String,
                        phoneNumber: String,
                        successBlock: @escaping (ForgotPasswordResponse) -> Void,
                        failBlock: @escaping (BaseError) -> Void) {
        let params: [String : Any] = ["email": email,
                                      "phone_number": phoneNumber]
        ClientNetwork.shared.sendRequest(params: getParams(dict: params),
                                         endPoint: AuthEndPoint.forgotPassword,
                                         parsingType: ForgotPasswordResponse.self,
                                         httpMethod: .post) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
    
    func resetPassword(userID: Int,
                       newPassword: String,
                       successBlock: @escaping (ForgotPasswordResponse) -> Void,
                       failBlock: @escaping (BaseError) -> Void) {
        let params: [String : Any] = ["new_password": newPassword,
                                      "user_id": userID]
        ClientNetwork.shared.sendRequest(params: getParams(dict: params),
                                         endPoint: AuthEndPoint.resetPassword,
                                         parsingType: ForgotPasswordResponse.self,
                                         httpMethod: .post) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
}
