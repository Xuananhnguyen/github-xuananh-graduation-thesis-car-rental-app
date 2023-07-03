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
    var fontSytle: TextStyle = .ROBOTO_MEDIUM
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            if !title.isEmpty {
                Text(title)
                    .textStyle(fontSytle, size: 16)
                    .foregroundColor(Color(GREEN_2B4C59))
            }
            
            ZStack(alignment: .trailing) {
                Group {
                    if isShowPassword {
                        TextField(inputContent, text: $inputContent)
                            .textStyle(fontSytle, size: 16)
                            .foregroundColor(Color(GRAY_A1A1A1))
                    } else {
                        SecureField(inputContent, text: $inputContent)
                            .textStyle(fontSytle, size: 16)
                            .foregroundColor(Color(GRAY_A1A1A1))
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
