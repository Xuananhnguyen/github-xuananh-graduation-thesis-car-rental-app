//
//  AppViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 11/10/2023.
//

import Foundation
import UIKit
import SwiftUI

class AppViewModel: ObservableObject {
    static var shared = AppViewModel()
    
    func showToast<Content: View>(
        toastSize: CGSize = CGSize(width: Utils.screenWidth, height: 50),
        duration: TimeInterval = 3.5,
        position: ToastPosition = .bottom,
        @ViewBuilder content: @escaping () -> Content,
        completion: ((Bool) -> Void)? = nil
    ) {
        if let window = UIApplication.shared.windows.first(where: {$0.isKeyWindow}) {
            if let view = UIHostingController(rootView: AnyView(content())).view {
                window.showToast(
                    view,
                    toastFrame: toastSize,
                    duration: duration,
                    position: position,
                    completion: completion
                )
            }
        }
    }
}
