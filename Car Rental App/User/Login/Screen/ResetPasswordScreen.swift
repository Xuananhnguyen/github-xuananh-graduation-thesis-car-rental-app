//
//  ResetPasswordScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 11/10/2023.
//

import SwiftUI

struct ResetPasswordScreen: AppNavigator {
    @StateObject var viewModel = ResetPasswordViewModel()
    var userID: Int?
    
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false) {
            VStack(alignment: .leading, spacing: 0){
                Text("resetPasswordTitle".localized)
                    .textStyle(.ROBOTO_BOLD, size: 25)
                    .foregroundColor(Color(BLACK_000000))
                    .padding(.vertical, 20)
                    
                SecureTextFieldView(title: "newPassword".localized.uppercased(),
                                    inputContent: $viewModel.newPassword)
                .padding(.bottom, 16)
                SecureTextFieldView(title: "confirmPassword".localized.uppercased(),
                                    inputContent: $viewModel.confirmPassword)
                .padding(.bottom, 28)
                
                Button(action: {
                    viewModel.validatePassword {
                        if let userID = userID {
                            viewModel.resetPassword(userID: userID) {
                                navigator.popToView(SignInScreen.self)
                            }
                        }
                    }
                    UIApplication.shared.endEditing()
                }, label: {
                    Text("resetPassword".localized)
                        .textStyle(.ROBOTO_BOLD, size: 20)
                        .foregroundColor(Color(WHITE_FFFFFF))
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(Color(GREEN_2B4C59))
                        .cornerRadius(10)
                })
                Spacer()
            }
            .padding(.horizontal, 24)
            .background(Color(WHITE_FFFFFF).ignoresSafeArea())
            .onTapGesture {
                self.dimissKeyBoard()
            }
        }
    }
}

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordScreen()
    }
}
