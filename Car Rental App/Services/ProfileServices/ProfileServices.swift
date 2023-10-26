//
//  ProfileServices.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 23/10/2023.
//

import Foundation

class ProfileServices: NSObject {
    static let shared = ProfileServices()
    
    func userProfile(successBlock: @escaping (UserProfileResponse) -> Void,
                     failBlock: @escaping (BaseError) -> Void) {
        let userID = AppDataManager.shared.authenticate?.userId ?? 0
        let params: [String : Any] = ["user_id": userID]
        ClientNetwork.shared.sendRequest(params: getParams(dict: params),
                                         endPoint: ProfileEndPoint.userProfile,
                                         parsingType: UserProfileResponse.self,
                                         httpMethod: .get) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
    
    func updateProfile(name: String,
                       email: String,
                       phoneNumber: String,
                       address: String,
                       successBlock: @escaping (UpdateProfileResponse) -> Void,
                       failBlock: @escaping (BaseError) -> Void) {
        let userID = AppDataManager.shared.authenticate?.userId ?? 0
        let params: [String : Any] = ["user_id": userID,
                                      "name": name,
                                      "email": email,
                                      "phone_number": phoneNumber,
                                      "address": address]
        ClientNetwork.shared.sendRequest(params: getParams(dict: params),
                                         endPoint: ProfileEndPoint.updateProfile,
                                         parsingType: UpdateProfileResponse.self,
                                         httpMethod: .post) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
    
    func userLicense(successBlock: @escaping (UserLicenseResponse) -> Void,
                     failBlock: @escaping (BaseError) -> Void) {
        let userID = AppDataManager.shared.authenticate?.userId ?? 0
        let params: [String : Any] = ["user_id": userID]
        ClientNetwork.shared.sendRequest(params: getParams(dict: params),
                                         endPoint: ProfileEndPoint.getUserLicense,
                                         parsingType: UserLicenseResponse.self,
                                         httpMethod: .get) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
    
    func updateLicense(idCard: String,
                       drivingLicense: String,
                       successBlock: @escaping (UpdateLicenseResponse) -> Void,
                       failBlock: @escaping (BaseError) -> Void) {
        let userID = AppDataManager.shared.authenticate?.userId ?? 0
        let params: [String : Any] = ["user_id": userID,
                                      "id_card": idCard,
                                      "driving_license":drivingLicense]
        ClientNetwork.shared.sendRequest(params: getParams(dict: params),
                                         endPoint: ProfileEndPoint.updateLicense,
                                         parsingType: UpdateLicenseResponse.self,
                                         httpMethod: .post) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
    
    func updatePassword(password: String,
                        newPassword: String,
                        successBlock: @escaping (ChangePasswordResponse) -> Void,
                        failBlock: @escaping (BaseError) -> Void) {
        let userID = AppDataManager.shared.authenticate?.userId ?? 0
        let params: [String : Any] = ["user_id": userID,
                                      "password": password,
                                      "new_password":newPassword]
        ClientNetwork.shared.sendRequest(params: getParams(dict: params),
                                         endPoint: ProfileEndPoint.updatePassword,
                                         parsingType: ChangePasswordResponse.self,
                                         httpMethod: .post) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
    
    func createReview(reservationID: Int,
                      vehicleID: Int,
                      rating: Int,
                      comment: String,
                      successBlock: @escaping (ReivewResponse) -> Void,
                      failBlock: @escaping (BaseError) -> Void) {
        let params: [String : Any] = ["reservation_id": reservationID,
                                      "vehicle_id": vehicleID,
                                      "rating":rating,
                                      "comment":comment]
        ClientNetwork.shared.sendRequest(params: getParams(dict: params),
                                         endPoint: ProfileEndPoint.createReview,
                                         parsingType: ReivewResponse.self,
                                         httpMethod: .post) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
}
