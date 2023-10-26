//
//  Data+Extension.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 03/10/2023.
//

import Foundation

extension Data {
    func dataToString() -> String? {
        return String(data: self, encoding: .utf8)
    }
    
    func dataToModel<T: Codable>(parsingType: T.Type) -> T? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: self)
        } catch {
            let err = error as! DecodingError
            switch err {
            case .typeMismatch(let key, let value):
                print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
            case .valueNotFound(let key, let value):
                print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
            case .keyNotFound(let key, let value):
                print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
            case .dataCorrupted(let key):
                print("error \(key), and ERROR: \(error.localizedDescription)")
            default:
                print("ERROR: \(error.localizedDescription)")
            }
            return nil
        }
    }
}
