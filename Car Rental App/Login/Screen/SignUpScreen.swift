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
                            Text("Sign Up")
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
                            TextFieldView(title: "Email".uppercased(),
                                          inputContent: $viewModel.email)
                            
                            SecureTextFieldView(title: "Password".uppercased(),
                                                inputContent: $viewModel.password)
                            
                            SecureTextFieldView(title: "Confirm Password".uppercased(),
                                                inputContent: $viewModel.confirmPassword)
                        }
                        .padding(.bottom, 30)
                        
                        Spacer()
                        
                        Button(action: {
                            if !viewModel.email.isEmpty || !viewModel.password.isEmpty || !viewModel.confirmPassword.isEmpty {
                                if viewModel.password != viewModel.confirmPassword {
                                    let confirmDialog = ConfirmDialog(content: "Password and Confirm Password not match")
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
    private func validate(email: String, password: String, confirmPassword: String) {
        if email.isEmpty || password.isEmpty {
            let confirmDialog = ConfirmDialog(content: "Email or Password empty")
            Popup.presentPopup(alertView: confirmDialog)
        } else if !email.validate(regex: REGEX.email) || !password.validate(regex: REGEX.password) {
            let confirmDialog = ConfirmDialog(content: "Email or Password invalid format")
            Popup.presentPopup(alertView: confirmDialog)
        } else {
            navigator.pushToView(view: HomeScreen())
        }
    }
    
    private func signUp() {
        Task {
            do {
                try await viewModel.signUp()
                print("Sign Up Success")
                navigator.pushToView(view: HomeScreen())
            } catch {
                print(error)
            }
        }
    }
}
