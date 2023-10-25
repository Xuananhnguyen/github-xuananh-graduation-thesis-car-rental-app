//
//  GetAllReservationResponse.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 24/10/2023.
//

import Foundation

struct GetAllReservationResponse: CarRentalAppResponse {
    var code: Int?
    var message: String?
    var data: [AdminReservationModel]?
}

struct AdminReservationModel: Codable, Hashable {
    let reservationId: Int?
    let userId: Int?
    let userName: String?
    let vehicleId: Int?
    let vehicleName: String?
    let vehicleImage: String?
    let vehicleRegistrationNumber: String?
    let color: String?
    let numberOfRentalDays: Int?
    let startDay: String?
    let endDay: String?
    let totalAmount: Int?
    let statusId: Int?
    let note: String?
    let invoiceCode: String?
}
