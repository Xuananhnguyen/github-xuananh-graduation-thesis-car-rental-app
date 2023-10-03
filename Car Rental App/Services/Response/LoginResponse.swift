//
//  LoginResponse.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 03/10/2023.
//

import Foundation

// MARK: - Welcome
struct LoginResponse: CarRentalAppResponse {
    var message: String?
    var code: Int?
    let data: DataLoginModel?
}

// MARK: - DataClass
struct DataLoginModel: Codable {
    let userId: Int?
    let name, email, phoneNumber: String?
    let address, idCard, license: String?
    let role: Int?
}
