//
//  CarModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 16/11/2022.
//

import Foundation

struct CarModel: Codable, Hashable {
    let nameCar: String?
    let brand: String?
    let priceDay: String?
    let maxSpeed: Int?
    let image: String?
}
