//
//  Enum.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 21/11/2022.
//

import Foundation

enum ProfileType: CaseIterable {
    case myProfile
    case carRental
    case license
    case settings
    case helpAndInfo
    
    var name: String {
        switch self {
        case .myProfile:
            return "myProfile".localized
        case .carRental:
            return "carRentalNoti".localized
        case .license:
            return "license".localized
        case .settings:
            return "settings".localized
        case .helpAndInfo:
            return "helpAndInfo".localized
        }
    }
}

enum SettingType: CaseIterable {
    case language
    case setPassword
    
    var nameSetting: String {
        switch self {
        case .language:
            return "language".localized
        case .setPassword:
            return "setPassword".localized
        }
    }
}


enum ReservationStatus: Int {
    case canceled = 0
    case awaitingDeposit = 1
    case depositConfirmed = 2
    case carReceived = 3
    case paymentComplete = 4
    case completed = 5
    
    var description: String {
        switch self {
        case .canceled:
            return "Đã hủy"
        case .awaitingDeposit:
            return "Chờ đặt cọc"
        case .depositConfirmed:
            return "Xác nhận đặt cọc"
        case .carReceived:
            return "Đã nhận xe"
        case .paymentComplete:
            return "Đã thanh toán"
        case .completed:
            return "Kết thúc"
        }
    }
    
    var renderColor: String {
        switch self {
        case .canceled:
            return RED_C64949
        case .awaitingDeposit:
            return PENDING_E08112
        case .depositConfirmed, .carReceived, .paymentComplete, .completed:
            return DONE_09581A
        }
    }
}



enum CarBrand: String, CaseIterable {
    case toyota = "Toyota"
    case honda = "Honda"
    case ford = "Ford"
    case vinFast = "VinFast"
    case hyundai = "Hyundai"
    case nissan = "Nissan"
    case kia = "KIA"
    case unknown = ""
    
    func getNumber() -> String {
        switch self {
        case .toyota:
            return "1"
        case .honda:
            return "2"
        case .ford:
            return "3"
        case .vinFast:
            return "4"
        case .hyundai:
            return "5"
        case .nissan:
            return "6"
        case .kia:
            return "7"
        case .unknown:
            return ""
        }
    }
}

enum CarCategory: String, CaseIterable {
    case sedan = "Sedan"
    case hatchBack = "HatchBack"
    case suv = "SUV – xe thể thao đa dụng"
    case cuv = "Crossover (CUV)"
    case mpv = "MPV/Minivan – xe đa dụng"
    case coupe = "Coupe – xe thể thao"
    case pickup = "Pickup – Xe bán tải"
    case unknown = ""
    
    func getNumber() -> String {
        switch self {
        case .sedan:
            return "1"
        case .hatchBack:
            return "2"
        case .suv:
            return "3"
        case .cuv:
            return "4"
        case .mpv:
            return "5"
        case .coupe:
            return "6"
        case .pickup:
            return "7"
        case .unknown:
            return ""
        }
    }
}

enum AdminManagerEnum: CaseIterable {
    case accountManagement
    case vehiclesManagement
    case reservationManagement
    case reviewManagement
    case revenueManagement
    
    var name: String {
        switch self  {
        case .accountManagement:
            return "Quản lý tài khoản"
        case .vehiclesManagement:
            return "Quản lý xe"
        case .reservationManagement:
            return "Quản lý lịch đặt xe"
        case .reviewManagement:
            return "Quản lý đánh giá"
        case .revenueManagement:
            return "Quản lý doanh thu"
        }
    }
}

enum UserRole: Int, CaseIterable {
    case users = 0
    case admin = 1
    
    var nameRole: String {
        switch self {
        case .users:
            return "Người dùng"
        case .admin:
            return "Quản trị viên"
        }
    }
}

enum VerifiedType: Int, CaseIterable {
    case unverified = 0
    case verified = 1
    
    var nameVerified: String {
        switch self {
        case .unverified:
            return "Chưa được xác thực"
        case .verified:
            return "Đã xác thực"
        }
    }
    
    var colorVerified: String {
        switch self {
        case .unverified:
            return RED_C64949
        case .verified:
            return DONE_09581A
        }
    }
}
