//
//  ForgotPasswordScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 11/03/2023.
//

import SwiftUI

struct ForgotPasswordScreen: AppNavigator {
    @StateObject var viewModel = ForgotPasswordViewModel()
    
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false) {
            VStack(alignment: .leading, spacing: 0){
                Text("titleForgotPassword".localized)
                    .textStyle(.ROBOTO_BOLD, size: 25)
                    .foregroundColor(Color(BLACK_000000))
                    .padding(.vertical, 20)
                    
                TextFieldView(title: "email".localized.uppercased(),
                              inputContent: $viewModel.email)
                .padding(.bottom, 28)
                
                Button(action: {
                    viewModel.validateEmail() {
                        Task {
                            do {
                                try await viewModel.resetPassword()
                                let confirmDialog = ConfirmDialog(content: "passwordResetLink".localized,
                                                                  confirmAction: {
                                    navigator.pop()
                                })
                                Popup.presentPopup(alertView: confirmDialog)
                                print("Reset Password success. Check your email")
                            } catch {
                                let confirmDialog = ConfirmDialog(content: error.localizedDescription)
                                Popup.presentPopup(alertView: confirmDialog)
                                print(error)
                            }
                        }
                    }
                    UIApplication.shared.endEditing()
                }, label: {
                    Text("resetPassword".localized.uppercased())
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
        }
    }
}
