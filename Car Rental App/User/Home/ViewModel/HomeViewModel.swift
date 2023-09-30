//
//  HomeViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 14/11/2022.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var listTypeCar: [TypeOfCarModel] = TypesMockData
    @Published var listCar: [CarModel] = CarBoxMockData
    @Published var listCarPrefix: [CarModel] = []
    
    func listPrefixCar() -> [CarModel] {
        listCarPrefix = listCar.prefix(4).map({ CarModel(nameCar: $0.nameCar, brand: $0.brand, priceDay: $0.priceDay, maxSpeed: $0.maxSpeed, image: $0.image) })
        
        return listCarPrefix
    }
    
    
}
