//
//  View+App.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 27/11/2022.
//

import SwiftUI

extension View {
    func textStyle(_ kind: TextStyle, size: CGFloat) -> some View {
        return self.font(kind.font(size: size))
    }
}
