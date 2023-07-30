//
//  TextStyle.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 15/11/2022.
//

import SwiftUI

enum TextStyle {
    case ROBOTO_THIN
    case ROBOTO_LIGHT
    case ROBOTO_REGULAR
    case ROBOTO_MEDIUM
    case ROBOTO_BOLD
    case ROBOTO_BLACK
    
    func font(size: CGFloat) -> Font {
        switch self {
        case .ROBOTO_THIN:
            return Font.custom("Roboto-Thin", size: size)
        case .ROBOTO_LIGHT:
            return Font.custom("Roboto-Light", size: size)
        case .ROBOTO_REGULAR:
            return Font.custom("Roboto-Regular", size: size)
        case .ROBOTO_MEDIUM:
            return Font.custom("Roboto-Medium", size: size)
        case .ROBOTO_BOLD:
            return Font.custom("Roboto-Bold", size: size)
        case .ROBOTO_BLACK:
            return Font.custom("Roboto-Black", size: size)
        }
    }
    
    func uiFont(size: CGFloat) -> UIFont {
        switch self {
        case .ROBOTO_THIN:
            return UIFont(name: "Roboto-Thin", size: size) ?? .systemFont(ofSize: size, weight: .regular)
        case .ROBOTO_LIGHT:
            return UIFont(name: "Roboto-Light", size: size) ?? .systemFont(ofSize: size, weight: .regular)
        case .ROBOTO_REGULAR:
            return UIFont(name: "Roboto-Regular", size: size) ?? .systemFont(ofSize: size, weight: .regular)
        case .ROBOTO_MEDIUM:
            return UIFont(name: "Roboto-Medium", size: size) ?? .systemFont(ofSize: size, weight: .medium)
        case .ROBOTO_BOLD:
            return UIFont(name: "Roboto-Bold", size: size) ?? .systemFont(ofSize: size, weight: .bold)
        case .ROBOTO_BLACK:
            return UIFont(name: "Roboto-Black", size: size) ?? .systemFont(ofSize: size, weight: .regular)
        }
    }
}
