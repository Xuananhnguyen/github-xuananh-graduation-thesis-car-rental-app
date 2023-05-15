//
//  SignUpScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 13/11/2022.
//

import SwiftUI
import VNavigator

struct SignUpScreen: AppNavigator {
    @State var phoneNumber: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false) {
            VStack(alignment: .center, spacing: 0) {
                Image(IMG_CAR)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 50)
                
                VStack(alignment: .center, spacing: 0) {
                    Text("Signup")
                        .font(.system(size: 48, weight: .regular))
                        .foregroundColor(Color(BLACK_000000))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 20)
                    
                    Divider()
                        .frame(width: 58, height: 4, alignment: .leading)
                        .background(Color(GREEN_2B4C59))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 20)
                    
                    VStack(spacing: 16){
                        TextFieldView(title: "Phone Number",
                                      inputContent: $phoneNumber)
                        
                        TextFieldView(title: "Email",
                                      inputContent: $email)
                        
                        SecureTextFieldView(title: "Password",
                                            inputContent: $password)
                        
                        SecureTextFieldView(title: "Confirm Password",
                                            inputContent: $confirmPassword)
                    }
                    .padding(.bottom, 30)
                    
                    Spacer()
                    
                    Button(action: {
                        if !phoneNumber.isEmpty || !email.isEmpty || !password.isEmpty || !confirmPassword.isEmpty {
                            if password != confirmPassword {
                                
                            } else {
                                navigator.pushToView(view: HomeScreen())
                            }
                        }
                    }, label: {
                        Text("Login".uppercased())
                            .font(.system(size: 20, weight: .bold))
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


extension SignUpScreen {
    private func validate(email: String, phoneNumber: String, password: String, confirmPassword: String) {
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
}
