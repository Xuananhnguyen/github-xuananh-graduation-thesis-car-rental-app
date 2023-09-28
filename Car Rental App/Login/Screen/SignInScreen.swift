//
//  SignInScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 08/11/2022.
//

import SwiftUI
import FirebaseAuth

@MainActor
struct SignInScreen: AppNavigator {
    @StateObject var viewModel = SignInViewModel()
    
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 0) {
                    Image(IMG_CAR)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 40)
                    Text("name".localized)
                        .textStyle(.ROBOTO_REGULAR, size: 48)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(GREEN_2B4C59))
                        .padding(.bottom, 20)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 60)
                    
                    TextFieldView(title: "email".localized.uppercased(),
                                  inputContent: $viewModel.email)
                    .padding(.bottom, 28)
                    
                    SecureTextFieldView(title: "password".localized.uppercased(),
                                        inputContent: $viewModel.password)
                    
                    Button(action: {
                        UIApplication.shared.endEditing()
                        navigator.pushToView(view: ForgotPasswordScreen())
                    }, label: {
                        Text("forgotPassword".localized)
                            .textStyle(.ROBOTO_REGULAR, size: 15)
                            .foregroundColor(Color(BLACK_000000))
                            .padding(.top, 12)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    })
                    .padding(.bottom, 60)
                    
                    Button(action: {
                        UIApplication.shared.endEditing()
                        viewModel.validate() {
                            Task {
                                do {
                                    try await viewModel.signIn()
                                    print("SignIn success")
                                    navigator.pushToView(view: HomeScreen())
                                } catch {
                                    print(error)
                                    if !error.localizedDescription.isEmpty {
                                        let confirmDialog = ConfirmDialog(content: "emailOrPasswordInvalid".localized)
                                        Popup.presentPopup(alertView: confirmDialog)
                                    }
                                }
                            }
                        }
                    }, label: {
                        Text("login".localized)
                            .textStyle(.ROBOTO_BOLD, size: 20)
                            .foregroundColor(Color(WHITE_FFFFFF))
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .background(Color(GREEN_2B4C59).opacity(viewModel.disabledButton() ? 0.5 : 1))
                            .cornerRadius(10)
                    })
                    .padding(.bottom, 30)
                    .disabled(viewModel.disabledButton())
                }
                .padding(.horizontal, 24)
                .background(Color(WHITE_FFFFFF).ignoresSafeArea())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
