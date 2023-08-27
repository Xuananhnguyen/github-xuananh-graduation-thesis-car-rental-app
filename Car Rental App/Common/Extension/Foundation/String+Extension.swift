//
//  String+Extension.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 12/03/2023.
//

import Foundation

extension String {
    func validate(regex: String) -> Bool {
        let validateRule = NSPredicate(format: "SELF MATCHES %@", regex)
        return validateRule.evaluate(with: self)
    }
    
    var localized: String {
        let localizedText = NSLocalizedString(self, comment: "")
        return localizedText.isEmpty ? self : localizedText
    }
    
    func convertDateString(fromFormat originalFormat: String, toFormat newFormat: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_us")
        dateFormatter.dateFormat = originalFormat
        dateFormatter.timeZone = TimeZone.current
        
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        
        dateFormatter.dateFormat = newFormat
        return dateFormatter.string(from: date)
    }
}
