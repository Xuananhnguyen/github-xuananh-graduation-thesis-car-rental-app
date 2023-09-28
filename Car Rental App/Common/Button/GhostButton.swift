//
//  GhostButton.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 25/06/2023.
//

import SwiftUI

struct GhostButton: View {
    var title: String
    var font: Font = TextStyle.ROBOTO_MEDIUM.font(size: 16)
    var isDisabled: Bool = false
    var textColor: Color = Color(BLACK_000000)
    var strokeColor: Color = Color(BLACK_000000)
    var paddingVertical: CGFloat = 10
    var paddingHorizontal: CGFloat = 30
    var lineWidth: CGFloat = 1
    var cornerRadius: CGFloat = 50.0
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
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(strokeColor, lineWidth: lineWidth))
            }
        )
        .disabled(isDisabled)
    }
}
