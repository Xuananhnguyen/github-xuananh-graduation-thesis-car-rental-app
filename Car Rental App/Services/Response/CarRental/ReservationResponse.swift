//
//  ReservationResponse.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 01/08/2023.
//

import Foundation

struct ReservationResponse: CarRentalAppResponse {
    var code: Int?
    var message: String?
    var data: [ReservationModel]?
}

struct ReservationModel: Codable, Hashable {
    var reservationId: Int?
    var vehicleId: Int?
    var vehicleName: String?
    var vehicleImage: String?
    var startDay: String?
    var endDay: String?
    var numberOfRentalDays: Int?
    var totalAmount: Int?
    var statusId: Int?
}
