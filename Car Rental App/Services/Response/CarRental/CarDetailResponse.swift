//
//  CarDetailResponse.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 21/10/2023.
//

import Foundation

struct CarDetailResponse: CarRentalAppResponse {
    var code: Int?
    var message: String?
    var data: CarModel?
}

struct CarModel: Codable {
    let vehicleID: Int?
    let vehicleName, brandName, categoryName: String?
    let year: Int?
    let color, registrationNumber: String?
    let rentalPricePerDay, limitedKmPerDay: Int?
    let collateral, description: String?
    let imageUrl: String?
}
