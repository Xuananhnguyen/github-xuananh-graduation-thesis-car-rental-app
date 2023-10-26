//
//  GetAllCarResponse.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 25/10/2023.
//

import Foundation

struct GetAllCarResponse: CarRentalAppResponse {
    var code: Int?
    var message: String?
    var data: [CarModel]?
}
