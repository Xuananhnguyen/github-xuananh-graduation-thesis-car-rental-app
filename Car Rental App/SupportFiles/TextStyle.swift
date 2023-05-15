//
//  TextStyle.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 15/11/2022.
//

import SwiftUI

enum TextStyle {
    case Roboto
    case Questrial
    case Hind_SemiBold
    case PT_Sans
    case Inconsolata_ExtraBold
    case Roboto_Regular
    case Imprima_Regular
    case Inter_Regular
    case Inter_Bold
    case Inter_Light
    case Roboto_Bold
    
    func font(size: CGFloat) -> Font {
        switch self {
        case .Roboto:
            return Font.custom("Roboto", size: size)
        case .Questrial:
            return Font.custom("Questrial", size: size)
        case .Hind_SemiBold:
            return Font.custom("Hind_SemiBold", size: size)
        case .PT_Sans:
            return Font.custom("PT_Sans", size: size)
        case .Inconsolata_ExtraBold:
            return Font.custom("Inconsolata_ExtraBold", size: size)
        case .Roboto_Regular:
            return Font.custom("Roboto_Regular", size: size)
        case .Imprima_Regular:
            return Font.custom("Imprima_Regular", size: size)
        case .Inter_Regular:
            return Font.custom("Inter_Regular", size: size)
        case .Inter_Bold:
            return Font.custom("Inter_Bold", size: size)
        case .Inter_Light:
            return Font.custom("Inter_Light", size: size)
        case .Roboto_Bold:
            return Font.custom("Roboto-Bold", size: size)
        }
    }
    
    func uiFont(size: CGFloat) -> UIFont {
        switch self {
        case .Roboto:
            return UIFont(name: "Roboto", size: size) ?? .systemFont(ofSize: size, weight: .medium)
        case .Questrial:
            return UIFont(name: "Questrial", size: size) ?? .systemFont(ofSize: size, weight: .regular)
        case .Hind_SemiBold:
            return UIFont(name: "Hind_SemiBold", size: size) ?? .systemFont(ofSize: size, weight: .bold)
        case .PT_Sans:
            return UIFont(name: "PT_Sans", size: size) ?? .systemFont(ofSize: size, weight: .bold)
        case .Inconsolata_ExtraBold:
            return UIFont(name: "Inconsolata_ExtraBold", size: size) ?? .systemFont(ofSize: size, weight: .regular)
        case .Roboto_Regular:
            return UIFont(name: "Roboto_Regular", size: size) ?? .systemFont(ofSize: size, weight: .regular)
        case .Imprima_Regular:
            return UIFont(name: "Imprima_Regular", size: size) ?? .systemFont(ofSize: size, weight: .regular)
        case .Inter_Regular:
            return UIFont(name: "Inter_Regular", size: size) ?? .systemFont(ofSize: size, weight: .regular)
        case .Inter_Bold:
            return UIFont(name: "Inter_Bold", size: size) ?? .systemFont(ofSize: size, weight: .bold)
        case .Inter_Light:
            return UIFont(name: "Inter_Light", size: size) ?? .systemFont(ofSize: size, weight: .light)
        case .Roboto_Bold:
            return UIFont(name: "Roboto-Bold", size: size) ?? .systemFont(ofSize: size, weight: .bold)
        }
    }
}
