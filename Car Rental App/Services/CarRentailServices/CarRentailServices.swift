//
//  CarRentailServices.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 12/10/2023.
//

import Foundation

class CarRentailServices: NSObject {
    static let shared = CarRentailServices()
    
    func searchCar(startDay: String,
                   endDay: String,
                   brandID: String,
                   color: String,
                   year: String,
                   categoryID: String,
                   successBlock: @escaping (SearchCarResponse) -> Void,
                   failBlock: @escaping (BaseError) -> Void) {
        let params: [String : Any] = ["start_day": startDay,
                                      "end_day": endDay,
                                      "brand_id": brandID,
                                      "color": color,
                                      "year": year,
                                      "category_id": categoryID]
        ClientNetwork.shared.sendRequest(params: getParams(dict: params),
                                         endPoint: CarRentalEndPoint.searchCar,
                                         parsingType: SearchCarResponse.self,
                                         httpMethod: .get) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
    
    func carDetail(vehicleID: Int,
                   successBlock: @escaping (CarDetailResponse) -> Void,
                   failBlock: @escaping (BaseError) -> Void) {
        let params: [String : Any] = ["vehicle_id": vehicleID]
        ClientNetwork.shared.sendRequest(params: getParams(dict: params),
                                         endPoint: CarRentalEndPoint.carDetail,
                                         parsingType: CarDetailResponse.self,
                                         httpMethod: .get) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
    
    func submitCarRental(vehicleID: Int,
                         startDay: String,
                         endDay: String,
                         numberOfRentalDays: Int,
                         totalAmount: Int,
                         note: String,
                         invoiceCode: Int,
                         successBlock: @escaping (CarRentalSubmitResponse) -> Void,
                         failBlock: @escaping (BaseError) -> Void) {
        let userID = AppDataManager.shared.authenticate?.userId ?? 0
        let params: [String : Any] = ["user_id": userID,
                                      "vehicle_id": vehicleID,
                                      "start_day": startDay,
                                      "end_day": endDay,
                                      "number_of_rental_days": numberOfRentalDays,
                                      "total_amount": totalAmount,
                                      "note": note,
                                      "status_id": 1,
                                      "invoice_code": invoiceCode]
        ClientNetwork.shared.sendRequest(params: getParams(dict: params),
                                         endPoint: CarRentalEndPoint.carRentalSubmit,
                                         parsingType: CarRentalSubmitResponse.self,
                                         httpMethod: .post) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
}
