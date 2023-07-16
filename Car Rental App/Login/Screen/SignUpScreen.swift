//
//  SignUpScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 13/11/2022.
//

import SwiftUI
import VNavigator
import FirebaseAuth
import FirebaseDatabase

@MainActor
struct SignUpScreen: AppNavigator {
    @StateObject var viewModel = SignUpViewModel()
    
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 0) {
                    Image(IMG_CAR)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 50)
                    
                    VStack(alignment: .center, spacing: 0) {
                        VStack(alignment: .leading, spacing: 0){
                            Text("signUp".localized)
                                .textStyle(.IMPRIMA_REGULAR, size: 50)
                                .foregroundColor(Color(BLACK_000000))
                                .padding(.bottom, 20)
                            
                            VLine()
                                .background(Color(GREEN_2B4C59))
                                .frame(width: 58, height: 4, alignment: .leading)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 60)
                        
                        VStack(spacing: 16){
                            TextFieldView(title: "\("fullName".localized):",
                                          inputContent: $viewModel.fullName)
                            
                            TextFieldView(title: "\("email".localized):",
                                          inputContent: $viewModel.email)
                            
                            TextFieldView(title: "\("phoneNumber".localized):",
                                          inputContent: $viewModel.phoneNumber)
                            
                            SecureTextFieldView(title: "password".localized,
                                                inputContent: $viewModel.password)
                            
                            SecureTextFieldView(title: "confirmPassword".localized,
                                                inputContent: $viewModel.confirmPassword)
                        }
                        .padding(.bottom, 30)
                        
                        Spacer()
                        
                        Button(action: {
                            if !viewModel.email.isEmpty || !viewModel.password.isEmpty || !viewModel.confirmPassword.isEmpty {
                                if viewModel.password != viewModel.confirmPassword {
                                    let confirmDialog = ConfirmDialog(content: "passwordAndConfirmPasswordNotMatch".localized)
                                    Popup.presentPopup(alertView: confirmDialog)
                                } else {
                                    signUp()
                                }
                            }
                        }, label: {
                            Text("Login".uppercased())
                                .textStyle(.INTER_BOLD, size: 20)
                                .foregroundColor(Color(WHITE_FFFFFF))
                                .frame(maxWidth: .infinity)
                                .frame(height: 52)
                                .background(Color(GREEN_2B4C59))
                                .cornerRadius(10)
                        })
                    }
                    .padding(.horizontal, 24)
                }
                .background(Color(WHITE_FFFFFF).ignoresSafeArea())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}


extension SignUpScreen {
    private func signUp() {
        Task {
            do {
                try await viewModel.signUp()
                print("Sign Up Success")
                let confirmDialog = ConfirmDialog(content: "successfulAccountRegistration".localized) {
                    navigator.pop()
                }
                Popup.presentPopup(alertView: confirmDialog)
            } catch {
                print(error)
            }
        }
    }
}
