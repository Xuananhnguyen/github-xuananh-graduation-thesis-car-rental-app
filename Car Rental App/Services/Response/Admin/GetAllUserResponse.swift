//
//  GetAllUserResponse.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 24/10/2023.
//

import Foundation

struct GetAllUserResponse: CarRentalAppResponse {
    var code: Int?
    var message: String?
    var data: [UserModel]?
}

struct UserModel: Codable, Hashable {
    var userId: Int?
    var name, email, phoneNumber, address: String?
    var role: Int?
    var verified: Int?
    var idCard, drivingLicense: String?
    var statusAccount: String?
}
