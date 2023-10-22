//
//  DropdownMenuOption.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 22/10/2023.
//

import Foundation

// We are going to use this type with ForEach, so we need to conform it to
// Hashable protocol.
struct DropdownMenuOption: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}

extension DropdownMenuOption {
    static let allBrandCar: [DropdownMenuOption] = [
        DropdownMenuOption(option: CarBrand.toyota.rawValue),
        DropdownMenuOption(option: CarBrand.honda.rawValue),
        DropdownMenuOption(option: CarBrand.ford.rawValue),
        DropdownMenuOption(option: CarBrand.vinFast.rawValue),
        DropdownMenuOption(option: CarBrand.hyundai.rawValue),
        DropdownMenuOption(option: CarBrand.nissan.rawValue),
        DropdownMenuOption(option: CarBrand.kia.rawValue)
    ]
    
    static let allCategory: [DropdownMenuOption] = [
        DropdownMenuOption(option: CarCategory.sedan.rawValue),
        DropdownMenuOption(option: CarCategory.hatchBack.rawValue),
        DropdownMenuOption(option: CarCategory.suv.rawValue),
        DropdownMenuOption(option: CarCategory.cuv.rawValue),
        DropdownMenuOption(option: CarCategory.mpv.rawValue),
        DropdownMenuOption(option: CarCategory.coupe.rawValue),
        DropdownMenuOption(option: CarCategory.pickup.rawValue)
    ]
    
    static let allColor: [DropdownMenuOption] = [
        DropdownMenuOption(option: "Cam"),
        DropdownMenuOption(option: "Nâu"),
        DropdownMenuOption(option: "Trắng"),
        DropdownMenuOption(option: "Vàng"),
        DropdownMenuOption(option: "Xám"),
        DropdownMenuOption(option: "Xanh dương"),
        DropdownMenuOption(option: "Đen"),
        DropdownMenuOption(option: "Đỏ")
    ]
    
    static let allYear: [DropdownMenuOption] = [
        DropdownMenuOption(option: "2018"),
        DropdownMenuOption(option: "2019"),
        DropdownMenuOption(option: "2020"),
        DropdownMenuOption(option: "2021"),
        DropdownMenuOption(option: "2022"),
        DropdownMenuOption(option: "2023"),
    ]
}

