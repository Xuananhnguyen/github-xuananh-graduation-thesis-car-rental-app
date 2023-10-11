//
//  ForgotPasswordResponse.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 11/10/2023.
//

import Foundation

struct ForgotPasswordResponse: CarRentalAppResponse {
    var message: String?
    var code: Int?
    var userId: Int?
}
