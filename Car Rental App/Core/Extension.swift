//
//  Extension.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 05/03/2023.
//

import UIKit

extension UIView {
    func constraintAll(to view: UIView) {
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
