//
//  UIApplication+Extension.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 12/03/2023.
//

import UIKit

extension UIApplication {
    func endEditing() {
        DispatchQueue.main.async {
            self.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}
