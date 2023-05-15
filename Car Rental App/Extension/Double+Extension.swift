//
//  DoubleExtension.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 12/03/2023.
//

import Foundation
import UIKit

extension Double {
    var w: CGFloat {
        return UIScreen.width * CGFloat(self)
    }
    
    var h: CGFloat {
        return UIScreen.height * CGFloat(self)
    }
}

extension UIScreen {
    static var height: CGFloat { return UIScreen.main.bounds.size.height }
    static var width: CGFloat { return UIScreen.main.bounds.size.width }
    static var center: CGPoint { return CGPoint(x: UIScreen.width / 2, y: UIScreen.height / 2) }
    static var size: CGSize { return UIScreen.main.bounds.size }
}
