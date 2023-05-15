//
//  CartModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 11/12/2022.
//

import Foundation

struct CartModel: Codable, Hashable {
    let name: String?
    let price: Int?
    let image: String?
    let quality: Int?
}
