//
//  GetRevenueResponse.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 01/11/2023.
//

import Foundation

struct GetRevenueResponse: CarRentalAppResponse {
    var code: Int?
    var message: String?
    var data: RevenueModel?
}

struct RevenueModel: Codable {
    var totalReservations: Int?
    var totalCost: Int?
}
