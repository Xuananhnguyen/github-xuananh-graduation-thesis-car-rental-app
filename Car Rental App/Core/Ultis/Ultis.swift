//
//  Ultis.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 03/10/2023.
//

import Foundation
import Alamofire

class Utils: NSObject {
    static func checkNetWorkConnection() -> Bool {
        let sharedInstance = NetworkReachabilityManager()!
        return sharedInstance.isReachable
    }
    
    static var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    static var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
}
