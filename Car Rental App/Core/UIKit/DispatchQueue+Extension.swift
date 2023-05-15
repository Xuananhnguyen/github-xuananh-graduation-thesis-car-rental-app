//
//  DispatchQueue+Extension.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 12/03/2023.
//

import Foundation

extension DispatchQueue {
    class func mainAsync(execute work: @escaping @convention(block) () -> Swift.Void) {
        DispatchQueue.main.async {
            work()
        }
    }
}
