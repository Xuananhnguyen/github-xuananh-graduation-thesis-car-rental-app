//
//  ButtonAuth.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 31/07/2023.
//

import SwiftUI

struct ButtonAuth: View {
    var title: String
    var font: Font = TextStyle.ROBOTO_BOLD.font(size: 20)
    var textColor: Color = Color(WHITE_FFFFFF)
    var paddingVertical: CGFloat = 10
    var paddingHorizontal: CGFloat = 30
    var cornerRadius: CGFloat = 10
    var backgroundColor: Color = Color(GREEN_2B4C59)
    var width: CGFloat = .infinity
    var isDisabled: Bool = false
    var onPress: () -> Void
    
    var body: some View {
        Button(action: {
            onPress()
        }, label: {
            Text(title)
                .font(font)
                .foregroundColor(textColor)
                .padding(.vertical, paddingVertical)
                .padding(.horizontal, paddingHorizontal)
                
            }
        )
        .frame(maxWidth: width)
        .background(isDisabled ? backgroundColor.opacity(0.5) : backgroundColor)
        .cornerRadius(cornerRadius)
        .disabled(isDisabled)
    }
}
