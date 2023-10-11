//
//  EndPoint.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 02/10/2023.
//

import Foundation

// MARK: API FOR USER
struct AuthEndPoint {
    static let signIn = "/sign_in.php"
    static let signUp = "/sign_up.php"
    static let forgotPassword = "/forgot_password.php"
    static let resetPassword = "/reset_password.php"
    static let updatePassword = "/update_password.php"
}

struct CarRentalEndPoint {
    static let searchCar = "/search_car.php"
}

// MARK: API FOR ADMIN
struct AdminEndPoint {
    static let getAllUser = "/get_all_user.php"
}
