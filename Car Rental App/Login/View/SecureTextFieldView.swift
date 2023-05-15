//
//  SecureTextFieldView.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 09/11/2022.
//

import SwiftUI

struct SecureTextFieldView: View {
    @State var title: String = "Password"
    @Binding var inputContent: String
    @State var isShowPassword: Bool = false
    var fontSizeTitle: CGFloat = 16
    var fontWeight: Font.Weight = .regular
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.system(size: fontSizeTitle, weight: fontWeight))
            ZStack(alignment: .trailing) {
                Group {
                    if isShowPassword {
                        TextField(inputContent, text: $inputContent)
                            .font(.system(size: 16, weight: .light))
                    } else {
                        SecureField(inputContent, text: $inputContent)
                            .font(.system(size: 16, weight: .light))
                    }
                }
                .padding(.trailing, 32)
                Spacer()
                if !inputContent.isEmpty {
                    Button(action: {
                        isShowPassword.toggle()
                    }, label: {
                        Image(isShowPassword ? "IC_OPEN_EYE" : "IC_CLOSE_EYE")
                            .resizable()
                            .frame(width: 24, height: 24)
                    })
                }
            }
            Divider()
                .frame(height: 2)
                .background(Color(GRAY_E5E5E5))
        }
    }
}
