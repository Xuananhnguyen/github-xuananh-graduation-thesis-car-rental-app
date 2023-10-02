//
//  PopupHelper.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 12/08/2023.
//

import UIKit
import SwiftUI
import SwiftEntryKit

struct PopupHelper {
    static func presentPopup<AlertView: View>(alertView: AlertView, isDismissWhenTapOverlay: Bool = true, isExpired: Bool = false) {
//        if AppDataManager.shared.isRequestExpired {
//            return
//        }
//
//        AppDataManager.shared.isRequestExpired = isExpired

        DispatchQueue.mainAsync {
            let viewController = UIHostingController(rootView: alertView)
            UIApplication.shared.endEditing()
            viewController.view.backgroundColor = UIColor.clear
            var attributes =  PopupHelper.defaultSettings
            attributes.screenInteraction = isDismissWhenTapOverlay ? .dismiss : .absorbTouches
            SwiftEntryKit.display(entry: viewController, using: attributes)
        }
    }
    
    static func dismiss(completionHandler: (() -> Void)? = nil) {
//        AppDataManager.shared.isRequestExpired = false
        if SwiftEntryKit.isCurrentlyDisplaying {
            SwiftEntryKit.dismiss {
                completionHandler?()
            }
        }
    }
    
    static var defaultSettings: EKAttributes {
        var attributes = EKAttributes.centerFloat
        attributes.windowLevel = .alerts
        attributes.screenBackground = .color(color: EKColor(UIColor.black.withAlphaComponent(0.5)))
        attributes.entranceAnimation = .init(fade: .init(from: 0, to: 1, duration: 0.25))
        attributes.exitAnimation = .init(fade: .init(from: 1, to: 0, duration: 0.3))
        attributes.popBehavior = .animated(animation: .init(fade: .init(from: 1, to: 0, duration: 2.5)))
        attributes.scroll = .disabled
        attributes.displayDuration = .infinity
        // to disable tap dim to dismiss change this property
//        attributes.screenInteraction = .dismiss
        attributes.entryInteraction = .absorbTouches
        attributes.statusBar = EKAttributes.StatusBar.dark
        attributes.precedence = .enqueue(priority: .normal)
        attributes.positionConstraints.maxSize = .init(width: .constant(value: UIScreen.width), height: .constant(value: UIScreen.height - 140))
        return attributes
    }
}

