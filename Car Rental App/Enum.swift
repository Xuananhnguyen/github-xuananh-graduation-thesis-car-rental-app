//
//  Enum.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 21/11/2022.
//

import Foundation

enum ProfileType: CaseIterable {
    case myProfile
    case settings
    case helpAndInfo
    case carRental
    
    var name: String {
        switch self {
        case .myProfile:
            return "myProfile".localized
        case .settings:
            return "settings".localized
        case .helpAndInfo:
            return "helpAndInfo".localized
        case .carRental:
            return "carRentalNoti".localized
        }
    }
    
    var icon: String {
        switch self {
        case .myProfile:
            return IC_MY_PROFILE
        case .settings:
            return IC_SETTINGS
        case .helpAndInfo:
            return IC_HELP_INFO
        case .carRental:
            return IC_BELL
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

enum ColorStatus: String {
    case done = "done"
    case pending = "pending"
    case cancel = "cancel"
    
    var retColor: String {
        switch self {
        case .done:
            return DONE_09581A
        case .pending:
            return PENDING_E08112
        case .cancel:
            return RED_C64949
        }
    }
}
