//
//  View+Extension.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 20/06/2023.
//

import Foundation
import SwiftUI
import CoreGraphics
import Combine
import UIKit

// MARK: - Frame
extension View {
    func expandedAll(alignment: Alignment? = nil) -> some View {
        self.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment ?? .center)
    }

    func expanded(alignment: Alignment? = nil) -> some View {
        self.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: alignment ?? .center)
    }
    
    func expandedWidth(alignment: Alignment? = nil) -> some View {
        self.frame(maxWidth: .infinity, alignment: alignment ?? .center)
    }
    
    func expandedHeight(alignment: Alignment? = nil) -> some View {
        self.frame(maxHeight: .infinity, alignment: alignment ?? .center)
    }
    
    func height(_ value: CGFloat, alignment: Alignment = .center) -> some View {
        self.frame(height: value, alignment: alignment)
    }
    
    func width(_ value: CGFloat, alignment: Alignment = .center) -> some View {
        self.frame(width: value, alignment: alignment)
    }
    
    func dimissKeyBoard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

// MARK: -
extension View {
    public func addBorderRound<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
        let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
        return clipShape(roundedRect)
            .overlay(roundedRect.strokeBorder(content, lineWidth: width))
    }
}

extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
    
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }

    func enable(_ isEnable: Bool) -> some View {
        self.opacity(isEnable ? 1 : 0.3)
            .disabled(!isEnable)
    }
    
    func onTapGestureForced(perform action: @escaping () -> Void) -> some View {
        self
            .contentShape(Rectangle())
            .onTapGesture {
                action()
            }
    }
}

//MARK: - Spacer
extension Spacer {
    public func onTapGestureSpacer(count: Int = 1, perform action: @escaping () -> Void) -> some View {
        ZStack {
            Color.black.opacity(0.001).onTapGesture(count: count, perform: action)
            self
        }
    }
}

