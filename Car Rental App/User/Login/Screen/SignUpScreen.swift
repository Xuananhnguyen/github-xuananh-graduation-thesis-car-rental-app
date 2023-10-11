//
//  SignUpScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 13/11/2022.
//

import SwiftUI
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
                        .padding(.bottom, 20)
                    
                    VStack(alignment: .center, spacing: 0) {
                        Text("signUp".localized)
                            .textStyle(.ROBOTO_REGULAR, size: 48)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(GREEN_2B4C59))
                            .padding(.bottom, 20)
                        
                        VStack(spacing: 16){
                            TextFieldView(title: "\("fullName".localized)".uppercased(),
                                          inputContent: $viewModel.fullName)
                            
                            TextFieldView(title: "\("email".localized)".uppercased(),
                                          inputContent: $viewModel.email)
                            
                            TextFieldView(title: "\("phoneNumber".localized)".uppercased(),
                                          inputContent: $viewModel.phoneNumber)
                            
                            SecureTextFieldView(title: "password".localized.uppercased(),
                                                inputContent: $viewModel.password)
                            
                            SecureTextFieldView(title: "confirmPassword".localized.uppercased(),
                                                inputContent: $viewModel.confirmPassword)
                        }
                        .padding(.bottom, 30)
                        
                        Spacer()
                        
                        Button(action: {
                            viewModel.validate {
                                if viewModel.password != viewModel.confirmPassword {
                                    let confirmDialog = ConfirmDialog(content: "passwordAndConfirmPasswordNotMatch".localized)
                                    Popup.presentPopup(alertView: confirmDialog)
                                } else {
                                    viewModel.signUp()
                                }
                            }
                        }, label: {
                            Text("signUp".localized)
                                .textStyle(.ROBOTO_BOLD, size: 20)
                                .foregroundColor(Color(WHITE_FFFFFF))
                                .frame(maxWidth: .infinity)
                                .frame(height: 52)
                                .background(Color(GREEN_2B4C59).opacity(viewModel.disabledButton() ? 0.5 : 1))
                                .cornerRadius(10)
                        })
                        .padding(.bottom, 50)
                        .disabled(viewModel.disabledButton())
                    }
                    .padding(.horizontal, 24)
                }
                .background(Color(WHITE_FFFFFF).ignoresSafeArea())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
