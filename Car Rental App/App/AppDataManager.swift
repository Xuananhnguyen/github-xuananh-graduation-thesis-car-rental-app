//
//  AppDataManager.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 12/03/2023.
//

import UIKit
import SwiftUI
import SwiftyJSON

class AppDataManager: ObservableObject {
    static let shared = AppDataManager()
    
    var authenticate: DataLoginModel? {
        get {
            UserDefaultCustom.getObject(DataLoginModel.self, key: KEY.AUTHENTICATE) ?? nil
        } set {
            UserDefaultCustom.saveObject(newValue, key: KEY.AUTHENTICATE)
        }
    }
}


