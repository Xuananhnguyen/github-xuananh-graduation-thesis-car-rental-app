//
//  SignInScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 08/11/2022.
//

import SwiftUI
import VNavigator
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
                    VStack(alignment: .leading, spacing: 0){
                        Text("signIn".localized)
                            .textStyle(.IMPRIMA_REGULAR, size: 50)
                            .foregroundColor(Color(BLACK_000000))
                            .padding(.bottom, 20)
                        
                        VLine()
                            .background(Color(GREEN_2B4C59))
                            .frame(width: 58, height: 4, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
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
                            .textStyle(.INTER_REGULAR, size: 15)
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
                                        let confirmDialog = ConfirmDialog(content: "checkAccount".localized)
                                        Popup.presentPopup(alertView: confirmDialog)
                                    }
                                }
                            }
                        }
                    }, label: {
                        Text("login".localized.uppercased())
                            .textStyle(.INTER_BOLD, size: 20)
                            .foregroundColor(Color(WHITE_FFFFFF))
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .background(Color(GREEN_2B4C59).opacity(viewModel.disabledButton() ? 0.5 : 1))
                            .cornerRadius(10)
                    })
                    .padding(.bottom, 30)
                    .disabled(viewModel.disabledButton())
                    
                    HStack(spacing: 0){
                        Text("notHaveAccount".localized)
                            .textStyle(.INTER_REGULAR, size: 15)
                            .foregroundColor(Color(BLACK_000000))
                        Spacer()
                        Button(action: {
                            UIApplication.shared.endEditing()
                            navigator.pushToView(view: SignUpScreen())
                        }, label: {
                            Text("signUp".localized.uppercased())
                                .textStyle(.INTER_BOLD, size: 13)
                                .foregroundColor(Color(YELLOW_FCC21B))
                        })
                    }
                }
                .padding(.horizontal, 24)
                .background(Color(WHITE_FFFFFF).ignoresSafeArea())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
