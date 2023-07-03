//
//  Car_Rental_AppApp.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 07/11/2022.
//

import SwiftUI
import Firebase

@main
struct Car_Rental_AppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            GetStartedScreen()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    static var orientationLock = UIInterfaceOrientationMask.portrait
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        setupFirebase()
        
        return true
    }
}


// MARK: - FIREBASE
extension AppDelegate {
    func setupFirebase() {
        FirebaseApp.configure()
    }
}


