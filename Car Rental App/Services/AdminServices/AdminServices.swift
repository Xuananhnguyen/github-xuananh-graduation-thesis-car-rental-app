//
//  AdminServices.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 24/10/2023.
//

import Foundation

class AdminServices: NSObject {
    static let shared = AdminServices()
    
    func getAllUser(successBlock: @escaping (GetAllUserResponse) -> Void,
                     failBlock: @escaping (BaseError) -> Void) {
        ClientNetwork.shared.sendRequest(endPoint: AdminEndPoint.getAllUser,
                                         parsingType: GetAllUserResponse.self,
                                         httpMethod: .get) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
    
    func getAllReservation(successBlock: @escaping (GetAllReservationResponse) -> Void,
                     failBlock: @escaping (BaseError) -> Void) {
        ClientNetwork.shared.sendRequest(endPoint: AdminEndPoint.getAllReservation,
                                         parsingType: GetAllReservationResponse.self,
                                         httpMethod: .get) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
    
    func getAllCar(successBlock: @escaping (GetAllCarResponse) -> Void,
                     failBlock: @escaping (BaseError) -> Void) {
        ClientNetwork.shared.sendRequest(endPoint: AdminEndPoint.getAllCar,
                                         parsingType: GetAllCarResponse.self,
                                         httpMethod: .get) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
    
    func getAllReview(successBlock: @escaping (GetAllReviewResponse) -> Void,
                     failBlock: @escaping (BaseError) -> Void) {
        ClientNetwork.shared.sendRequest(endPoint: AdminEndPoint.getAllReview,
                                         parsingType: GetAllReviewResponse.self,
                                         httpMethod: .get) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
    
    func verifiedUser(status: String,
                      userID: Int,
                      successBlock: @escaping (VerifiedUserResponse) -> Void,
                      failBlock: @escaping (BaseError) -> Void) {
        let params: [String : Any] = ["user_id": userID,
                                      "status": status]
        ClientNetwork.shared.sendRequest(params: getParams(dict: params),
                                         endPoint: AdminEndPoint.verifiedUser,
                                         parsingType: VerifiedUserResponse.self,
                                         httpMethod: .post) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
    
    func approveReservation(reservationID: Int,
                            statusID: Int,
                            successBlock: @escaping (VerifiedUserResponse) -> Void,
                            failBlock: @escaping (BaseError) -> Void) {
        let params: [String : Any] = ["status_id": statusID,
                                      "reservation_id": reservationID]
        ClientNetwork.shared.sendRequest(params: getParams(dict: params),
                                         endPoint: AdminEndPoint.approveReservation,
                                         parsingType: VerifiedUserResponse.self,
                                         httpMethod: .post) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
}
