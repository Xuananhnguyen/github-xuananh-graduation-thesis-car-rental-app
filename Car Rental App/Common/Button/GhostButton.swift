//
//  GhostButton.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 25/06/2023.
//

import SwiftUI

struct GhostButton: View {
    var onPress: () -> Void
    var title: String
    var isDisabled: Bool = false
    var paddingHorizontal: CGFloat = 30
    
    var body: some View {
        Button(action: {
            onPress()
        }, label: {
            Text(title)
                .textStyle(.ROBOTO_MEDIUM, size: 16)
                .foregroundColor(Color(BLACK_000000))
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .padding(.vertical, 10)
                .padding(.horizontal, paddingHorizontal)
                .overlay(
                    RoundedRectangle(cornerRadius: 50.0)
                    .stroke(Color(BLACK_000000), lineWidth: 1))
            }
        )
        .disabled(isDisabled)
    }
}
