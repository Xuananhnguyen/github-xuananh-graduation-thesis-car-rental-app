//
//  TextStyle.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 15/11/2022.
//

import SwiftUI

enum TextStyle {
    case ROBOTO_REGULAR
    case ROBOTO_MEDIUM
    case ROBOTO_BOLD
    case INTER_REGULAR
    case INTER_MEDIUM
    case INTER_BOLD
    case PT_SANS_REGULAR
    case PT_SANS_BOLD
    case IMPRIMA_REGULAR
    
    func font(size: CGFloat) -> Font {
        switch self {
        case .ROBOTO_REGULAR:
            return Font.custom("Roboto-Regular", size: size)
        case .ROBOTO_MEDIUM:
            return Font.custom("Roboto-Medium", size: size)
        case .ROBOTO_BOLD:
            return Font.custom("Roboto-Bold", size: size)
        case .INTER_REGULAR:
            return Font.custom("Inter-Regular", size: size)
        case .INTER_MEDIUM:
            return Font.custom("Inter-Medium", size: size)
        case .INTER_BOLD:
            return Font.custom("Inter-Bold", size: size)
        case .PT_SANS_REGULAR:
            return Font.custom("PTSans-Regular", size: size)
        case .PT_SANS_BOLD:
            return Font.custom("PTSans-Bold", size: size)
        case .IMPRIMA_REGULAR:
            return Font.custom("Imprima-Regular", size: size)
        }
    }
    
    func uiFont(size: CGFloat) -> UIFont {
        switch self {
        case .ROBOTO_REGULAR:
            return UIFont(name: "Roboto-Regular", size: size) ?? .systemFont(ofSize: size, weight: .regular)
        case .ROBOTO_MEDIUM:
            return UIFont(name: "Roboto-Medium", size: size) ?? .systemFont(ofSize: size, weight: .medium)
        case .ROBOTO_BOLD:
            return UIFont(name: "Roboto-Bold", size: size) ?? .systemFont(ofSize: size, weight: .bold)
        case .INTER_REGULAR:
            return UIFont(name: "Inter-Regular", size: size) ?? .systemFont(ofSize: size, weight: .regular)
        case .INTER_MEDIUM:
            return UIFont(name: "Inter-Medium", size: size) ?? .systemFont(ofSize: size, weight: .medium)
        case .INTER_BOLD:
            return UIFont(name: "Inter-Bold", size: size) ?? .systemFont(ofSize: size, weight: .bold)
        case .PT_SANS_REGULAR:
            return UIFont(name: "PTSans-Regular", size: size) ?? .systemFont(ofSize: size, weight: .regular)
        case .PT_SANS_BOLD:
            return UIFont(name: "PTSans-Bold", size: size) ?? .systemFont(ofSize: size, weight: .bold)
        case .IMPRIMA_REGULAR:
            return UIFont(name:"Imprima-Regular", size: size) ?? .systemFont(ofSize: size, weight: .regular)
        }
    }
}
