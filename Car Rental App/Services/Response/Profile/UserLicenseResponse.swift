//
//  UserLicenseResponse.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 23/10/2023.
//

import Foundation

struct UserLicenseResponse: CarRentalAppResponse {
    var code: Int?
    var message: String?
    var data: UserLicenseModel?
}

struct UserLicenseModel: Codable {
    var idCard: String?
    var drivingLicense: String?
}
