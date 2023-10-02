//
//  UserDefaultCustom.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 12/08/2023.
//

import Foundation

class UserDefaultCustom {
    static let userDefaults = UserDefaults.standard
    
    static func save(key: String, value: Any?) {
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }
    
    static func load(key: String) -> Any? {
        let value: Any = userDefaults.object(forKey: key) as Any
        return value
    }
    
    static func saveObject<T: Codable>(_ object: T, key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: key)
        }
    }
    
    static func getObject<T: Codable>(_ type: T.Type, key: String) -> T? {
        let defaults = UserDefaults.standard
        if let data = defaults.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            let object = try? decoder.decode(type, from: data)
            return object
        }
        return nil
    }
}
