//
//  BackHeader.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 07/12/2022.
//

import SwiftUI

struct BackHeader: View {
    var backIcon: String = IC_ARROW_LEFT
    var featureIcon: String = IC_THREE_DOT
    var backgroundColor: Color = Color(WHITE_FFFFFF)
    var title: String = ""
    var textStyleTitle: Font = TextStyle.ROBOTO_MEDIUM.font(size: 20)
    var onPressBack: (() -> Void)?
    var onPressFeature: (() -> Void)?

    var body: some View {
        HStack(spacing: 16){
            if !backIcon.isEmpty {
                Image(IC_ARROW_LEFT)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(GREEN_2B4C59))
                    .frame(width: 13, height: 21)
                    .onTapGesture {
                        onPressBack?()
                    }
            }
            
            if !title.isEmpty {
                Text(title)
                    .font(textStyleTitle)
                    .foregroundColor(Color(GREEN_2B4C59))
            }
            
            Spacer()
        }
        .padding(.vertical, 6)
        .padding(.leading, 16)
        .frame(height: 44)
        .background(backgroundColor.ignoresSafeArea())
    }
}

