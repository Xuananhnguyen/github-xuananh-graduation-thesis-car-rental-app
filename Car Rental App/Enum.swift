//
//  Enum.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 21/11/2022.
//

import Foundation

enum ProfileType: String {
    case myProfile
    case settings
    case history
    case privacy
    case helpAndInfo
    
    var name: String {
        switch self {
        case .myProfile:
            return "My Profile"
        case .settings:
            return "Settings"
        case .history:
            return "History"
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
        case .history:
            return IC_BELL
        case .privacy:
            return IC_KEY
        case .helpAndInfo:
            return IC_HELP_INFO
        }
    }
}
