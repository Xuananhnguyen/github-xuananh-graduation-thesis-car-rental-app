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

struct CarResultModel: Codable, Hashable {
    var vehicleId: Int?
    var vehicleName: String?
    var brandName: String?
    var categoryName: String?
    var year: Int?
    var color: String?
    var rentalPricePerDay: Int?
    var imageUrl: String?
}
