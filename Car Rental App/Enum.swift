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
    case notification
    case privacy
    case helpAndInfo
    
    var name: String {
        switch self {
        case .myProfile:
            return "myProfile".localized
        case .settings:
            return "settings".localized
        case .notification:
            return "notification".localized
        case .privacy:
            return "privacy".localized
        case .helpAndInfo:
            return "helpAndInfo".localized
        }
    }
    
    var icon: String {
        switch self {
        case .myProfile:
            return IC_MY_PROFILE
        case .settings:
            return IC_SETTINGS
        case .notification:
            return IC_BELL
        case .privacy:
            return IC_KEY
        case .helpAndInfo:
            return IC_HELP_INFO
        }
    }
}

enum SettingType: CaseIterable {
    case profileSettings
    case language
    case setPassword
    
    var nameSetting: String {
        switch self {
        case .profileSettings:
            return "profileSettings".localized
        case .language:
            return "language".localized
        case .setPassword:
            return "setPassword".localized
        }
    }
}
