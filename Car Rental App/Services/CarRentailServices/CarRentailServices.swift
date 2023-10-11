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
                   successBlock: @escaping (SearchCarResponse) -> Void,
                   failBlock: @escaping (BaseError) -> Void) {
        let params: [String : Any] = ["start_day": startDay,
                                      "end_day": endDay]
        ClientNetwork.shared.sendRequest(params: getParams(dict: params),
                                         endPoint: CarRentalEndPoint.searchCar,
                                         parsingType: SearchCarResponse.self,
                                         httpMethod: .get) { response in
            successBlock(response)
        } failBlock: { error in
            failBlock(error)
        }
    }
}
