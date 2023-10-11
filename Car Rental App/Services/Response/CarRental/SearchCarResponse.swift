//
//  SearchCarResponse.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 12/10/2023.
//

import Foundation

struct SearchCarResponse: CarRentalAppResponse {
    var message: String?
    var code: Int?
    var data: [CarResultModel]?
}

struct CarResultModel: Codable {
    var vehicleId: Int?
    var vehicleName: String?
    var brandName: String?
    var categoryName: String?
    var year: Int?
    var color: String?
    var registrationNumber: String?
    var rentalPricePerDay: Int?
    var limitedKmPerDay: Int?
    var collateral: String?
    var description: String?
    var imageUrl: String?
}
