//
//  CarRentailDetailRespone.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 30/09/2023.
//

import Foundation

struct CarRentailDetailRespone: Codable, Hashable {
    var imageCar: String?
    var status: String?
    var titleCar: String?
    var price: String?
    var dateFrom: String?
    var dateTo: String?
    var statusType: String?
    
    enum CodingKeys: String, CodingKey {
        case imageCar = "imageCar"
        case status = "status"
        case titleCar = "titleCar"
        case price = "price"
        case dateFrom = "dataFrom"
        case dateTo = "dataTo"
        case statusType = "statusType"
    }
}
