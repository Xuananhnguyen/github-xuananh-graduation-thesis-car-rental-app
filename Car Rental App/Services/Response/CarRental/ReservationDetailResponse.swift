//
//  ReservationDetailResponse.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 30/09/2023.
//

import Foundation

struct ReservationDetailResponse: CarRentalAppResponse {
    var code: Int?
    var message: String?
    var data: ReservationDetailModel?
}

struct ReservationDetailModel: Codable {
    var reservationId: Int?
    var vehicleId: Int?
    var vehicleName: String?
    var vehicleImage: String?
    var color: String?
    var vehicleRegistrationNumber: String?
    var startDay, endDay: String?
    var numberOfRentalDays: Int?
    var totalAmount: Int?
    var note: String?
    var statusId: Int?
    var invoiceCode: String?
}
