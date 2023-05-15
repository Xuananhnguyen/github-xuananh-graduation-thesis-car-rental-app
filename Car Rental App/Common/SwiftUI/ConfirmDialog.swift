//
//  ConfirmDialog.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 12/03/2023.
//

import SwiftUI
import VNavigator

struct ConfirmDialog: AppNavigator {
    var title: String = ""
    var content: String
    var textStyleContent: TextStyle = .Roboto_Bold
    var textContentSize: CGFloat = 18
    var titleButton: String = "ok".uppercased()
    var enableScrollView: Bool = false
    var confirmAction: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            if !title.isEmpty {
                Spacer().frame(height: 16)
                Text(title)
                    .lineSpacing(6)
                    .multilineTextAlignment(.center)
                    .textStyle(.Roboto_Bold, size: 20)
                    .padding(.horizontal, 16)
            }
            Spacer().frame(height: 20)
            if !content.isEmpty {
                if enableScrollView {
                    ScrollView(showsIndicators: false) {
                        Text(content)
                            .foregroundColor(Color(BLACK_000000))
                            .multilineTextAlignment(.center)
                            .textStyle(textStyleContent, size: textContentSize)
                            .padding(.horizontal, 16)
                        Spacer().frame(height: 32)
                    }
                } else {
                    Text(content)
                        .foregroundColor(Color(BLACK_000000))
                        .multilineTextAlignment(.center)
                        .textStyle(textStyleContent, size: textContentSize)
                        .padding(.horizontal, 16)
                    Spacer().frame(height: 24)
                }
            }
            VLine()
                .background(Color(GRAY_BEBEBE))
                .frame(height: 1)
            HStack(spacing: 0) {
                Button(action: {
                    Popup.dismiss(completionHandler: {
                        confirmAction?()
                    })
                }, label: {
                    Text(titleButton)
                        .textStyle(.Roboto_Bold, size: 17)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color(GREEN_2B4C59))
                })
            }.frame(height: 40)
        }
        .foregroundColor(Color(BLACK_000000))
        .frame(minWidth: UIApplication.shared.statusBarOrientation.isLandscape ? 0.3.w : 0.7.w, maxWidth: UIApplication.shared.statusBarOrientation.isLandscape ? 0.3.w : 0.7.w)
        .background(Color(WHITE_FFFFFF))
        .cornerRadius(15)
        .padding(.vertical, 32)
    }
}
