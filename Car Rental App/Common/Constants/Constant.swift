//
//  Constant.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 12/03/2023.
//

import Foundation

struct REGEX {
    static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    static let password = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,50}$"
    static let phone = "^[0-9]$"
}
