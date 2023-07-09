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
}
