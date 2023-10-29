//
//  GetAllReviewResponse.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 25/10/2023.
//

import Foundation

struct GetAllReviewResponse: CarRentalAppResponse {
    var code: Int?
    var message: String?
    var data: [ReviewModel]?
}

struct ReviewModel: Codable {
    let reviewId: Int?
    let reservationId: Int?
    let vehicleId: Int?
    let vehicleName: String?
    let rating: Int?
    let comment: String?
}

