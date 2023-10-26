//
//  ChangePasswordScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 26/10/2023.
//

import SwiftUI

struct ChangePasswordScreen: AppNavigator {
    @StateObject var viewModel = ChangePasswordViewModel()
    
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false
        , title: "Thay đổi mật khẩu".localized) {
            VStack(alignment: .leading, spacing: 16){
                SecureTextFieldView(title: "Mật khẩu cũ".localized.uppercased(),
                                    inputContent: $viewModel.oldPassword)
                
                SecureTextFieldView(title: "newPassword".localized.uppercased(),
                                    inputContent: $viewModel.newPassword)
                SecureTextFieldView(title: "confirmPassword".localized.uppercased(),
                                    inputContent: $viewModel.confirmPassword)
                Spacer()
                
                Button(action: {
                    viewModel.validatePassword {
                        if viewModel.newPassword != viewModel.confirmPassword {
                            let confirmDialog = ConfirmDialog(content: "passwordAndConfirmPasswordNotMatch".localized)
                            Popup.presentPopup(alertView: confirmDialog)
                        } else {
                            viewModel.updatePassword(password: viewModel.oldPassword, newPassword: viewModel.newPassword) {
                                navigator.pop()
                            }
                        }
                    }
                }, label: {
                    Text("Đổi mật khẩu".localized)
                        .textStyle(.ROBOTO_BOLD, size: 20)
                        .foregroundColor(Color(WHITE_FFFFFF))
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(Color(GREEN_2B4C59))
                        .cornerRadius(10)
                })
            }
            .padding(.top, 20)
            .padding(.horizontal, 16)
            .expandedAll()
            .background(Color(WHITE_FFFFFF).ignoresSafeArea())
            .onTapGesture {
                self.dimissKeyBoard()
            }
        }
    }
}
