//
//  HomeViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 14/11/2022.
//

import Foundation

class HomeViewModel: ObservableObject {
    let listThumbNails: [String] = [THUMDNAIL_FIRST, THUMDNAIL_SECOND, THUMDNAIL_THIRD, THUMDNAIL_FOURTH]
    func getBrandCarNumber(brandCar: String) -> String {
        if let carBrand = CarBrand(rawValue: brandCar) {
            return carBrand.getNumber()
        } else {
            return ""
        }
    }
    
    func getCategoryCarNumber(categoryCar: String) -> String {
        if let categoryCar = CarCategory(rawValue: categoryCar) {
            return categoryCar.getNumber()
        } else {
            return ""
        }
    }
}
