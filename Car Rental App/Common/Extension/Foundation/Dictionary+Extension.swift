//
//  Dictionary+Extension.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 03/10/2023.
//

import Foundation

extension Dictionary {
    mutating func merge(dict: [Key: Value]) {
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}
