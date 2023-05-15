//
//  Car_Rental_AppApp.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 07/11/2022.
//

import SwiftUI

@main
struct Car_Rental_AppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            GetStartedScreen()
        }
    }
}
