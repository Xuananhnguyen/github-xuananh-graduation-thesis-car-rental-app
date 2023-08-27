//
//  Date+Extension.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 27/08/2023.
//

import Foundation

extension Date {
    func toString(withFormat format: String = "yyyy-MM-dd", timeZone: TimeZone = TimeZone.current, symbol: Bool = false, locale: Locale? = nil) -> String {
        let formater = DateFormatter()
        formater.dateFormat = format
        formater.timeZone = timeZone
        
        if locale != nil {
            formater.locale = locale
        }
        if symbol {
            formater.amSymbol = "am"
            formater.pmSymbol = "pm"
        }
        return formater.string(from: self)
    }
}
