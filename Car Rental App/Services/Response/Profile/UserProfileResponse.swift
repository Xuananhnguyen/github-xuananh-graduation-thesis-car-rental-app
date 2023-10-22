//
//  UserProfileResponse.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 23/10/2023.
//

import Foundation

struct UserProfileResponse: CarRentalAppResponse {
    var code: Int?
    var message: String?
    var data: UserProfileModel?
}

struct UserProfileModel: Codable {
    var name: String?
    var email: String?
    var phoneNumber: String?
    var address: String?
}
