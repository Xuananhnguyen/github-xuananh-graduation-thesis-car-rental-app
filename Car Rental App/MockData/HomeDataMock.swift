//
//  HomeDataMock.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 14/11/2022.
//

import Foundation

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
