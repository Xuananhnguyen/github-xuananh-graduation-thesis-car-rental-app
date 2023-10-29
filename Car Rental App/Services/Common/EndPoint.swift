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
}

struct CarRentalEndPoint {
    static let searchCar = "/search_car.php"
    static let carDetail = "/car_detail.php"
    static let carRentalSubmit = "/car_rental_submit.php"
}

struct ReservationEndPoint {
    static let getUserCarReservation = "/get_user_car_rental.php"
    static let userReservationDetail = "/user_reservation_detail.php"
}

struct ProfileEndPoint {
    static let userProfile = "/user_profile.php"
    static let updateProfile = "/update_profile.php"
    static let getUserLicense = "/get_user_license.php"
    static let updateLicense = "/update_user_license.php"
    static let updatePassword = "/update_password.php"
    static let createReview = "/create_review.php"
}

// MARK: API FOR ADMIN
struct AdminEndPoint {
    static let getAllUser = "/get_all_user.php"
    static let getAllReservation = "/get_all_reservation.php"
    static let getAllCar = "/get_all_car.php"
    static let getAllReview = "/get_all_review.php"
    static let verifiedUser = "/verified_user.php"
    static let approveReservation = "/approve_reservation.php"
}
