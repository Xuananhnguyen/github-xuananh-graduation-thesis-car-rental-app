//
//  Int+Extension.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 15/10/2023.
//

import Foundation

func calculateDayDifference(startDay: Date, endDay: Date) -> Int? {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.day], from: startDay, to: endDay)

    return (components.day ?? 0) + 1
}
