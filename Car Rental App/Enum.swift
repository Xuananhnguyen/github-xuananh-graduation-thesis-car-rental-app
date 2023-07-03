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
            return "My Profile"
        case .settings:
            return "Settings"
        case .notification:
            return "Notification"
        case .privacy:
            return "Privacy"
        case .helpAndInfo:
            return "Help & Info"
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
            return "Profile Settings"
        case .language:
            return "Language"
        case .setPassword:
            return "Set Password"
        }
    }
}
