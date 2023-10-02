//
//  LoginResponse.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 03/10/2023.
//

import Foundation

struct LoginResponse: CarRentalAppResponse {
    var code: Int?
    var message: String?
    var data: [DataLoginModel]?
}

struct DataLoginModel: Codable {
    var userId: Int?
    var name: String?
    var email: String?
    var phoneNumber: String?
    var address: String?
    var idCard: String?
    var license: String?
    var role: Int?
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case name = "name"
        case email = "email"
        case phoneNumber = "phone_number"
        case address = "address"
        case idCard = "id_card"
        case license = "license"
        case role = "role"
    }
}
