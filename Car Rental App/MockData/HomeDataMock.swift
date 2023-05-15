//
//  HomeDataMock.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 14/11/2022.
//

import Foundation

let TypesMockData: [TypeOfCarModel] = [TypeOfCarModel(name: "Family cars", isSeleted: true),
                                       TypeOfCarModel(name: "Luxuly cars", isSeleted: false),
                                       TypeOfCarModel(name: "Cheap cars", isSeleted: false)]


let CarBoxMockData: [CarModel] = [CarModel(nameCar: "AUDI Red A6", brand: "AUDI", priceDay: "180,000", maxSpeed: 350, image: IMG_AUDI_A6),
                                  CarModel(nameCar: "Toyota Camry 2022", brand: "Toyota", priceDay: "200,000", maxSpeed: 350, image: IMG_TOYOTA),
                                  CarModel(nameCar: "Range Rover", brand: "Range Rover", priceDay: "150,000", maxSpeed: 250, image: IMG_RANG_ROVER),
                                  CarModel(nameCar: "Tesla 1.0", brand: "Tesla", priceDay: "150,000", maxSpeed: 200, image: IMG_TESLA),
                                  CarModel(nameCar: "Tesla 2.0", brand: "Tesla", priceDay: "200,000", maxSpeed: 300, image: IMG_TESLA),
                                  CarModel(nameCar: "AUDI Red A8", brand: "AUDI", priceDay: "180,000", maxSpeed: 350, image: IMG_AUDI_A6),
                                  CarModel(nameCar: "Toyota Camry 2022", brand: "Toyota", priceDay: "250,000", maxSpeed: 399, image: IMG_TOYOTA),
                                  CarModel(nameCar: "Range Rover 2018", brand: "Range Rover", priceDay: "100,000", maxSpeed: 300, image: IMG_RANG_ROVER)]

struct ProfileModel: Codable, Hashable {
    let nameFeature: String?
    let imageFeature: String?
}

let mockDataProfile: [ProfileModel] = [ProfileModel(nameFeature: "My Profile", imageFeature: IC_MY_PROFILE),
                                       ProfileModel(nameFeature: "Settings", imageFeature: IC_SETTINGS),
                                       ProfileModel(nameFeature: "Notification", imageFeature: IC_BELL),
                                       ProfileModel(nameFeature: "Privacy", imageFeature: IC_KEY),
                                       ProfileModel(nameFeature: "Help & Info", imageFeature: IC_HELP_INFO)]

var listCart: [CartModel] = [CartModel(name: "AUDI Red A6", price: 180, image: IMG_AUDI_A6, quality: 2),
                             CartModel(name: "Toyota Camry 2022", price: 200, image: IMG_TOYOTA, quality: 1),
                             CartModel(name: "Range Rover", price: 150, image: IMG_RANG_ROVER, quality: 2),
                             CartModel(name: "Tesla 1.0", price: 150, image: IMG_TESLA, quality: 3)]
