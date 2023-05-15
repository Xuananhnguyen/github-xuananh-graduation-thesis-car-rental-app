//
//  SignInScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 08/11/2022.
//

import SwiftUI
import VNavigator

struct SignInScreen: AppNavigator {
    @State var email: String = ""
    @State var password: String = ""
    
    @State private var isDisable: Bool = true
    
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false) {
            VStack(alignment: .center, spacing: 0) {
                Image(IMG_CAR)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 50)
                
                Text("Login")
                    .font(.system(size: 48, weight: .regular))
                    .foregroundColor(Color(BLACK_000000))
                    .padding(.bottom, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                    .frame(width: 58, height: 4, alignment: .leading)
                    .background(Color(GREEN_2B4C59))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 20)
                
                TextFieldView(title: "Email",
                              inputContent: $email)
                .padding(.bottom, 28)
                
                
                SecureTextFieldView(title: "Password",
                                    inputContent: $password)
                
                Button(action: {
                    
                }, label: {
                    Text("Forgot password?")
                        .font(.system(size: 11, weight: .regular))
                        .foregroundColor(Color(BLACK_000000))
                        .padding(.top, 12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                })
                .padding(.bottom, 60)
                
                Button(action: {
                    validate(email: email, password: password)
                }, label: {
                    Text("Login".uppercased())
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(WHITE_FFFFFF))
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(Color(GREEN_2B4C59))
                        .cornerRadius(10)
                })                
                Spacer()
                
                HStack(spacing: 0){
                    Text("Don’t Have an account yet?")
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(Color(BLACK_000000))
                    Spacer()
                    Button(action: {
                        navigator.pushToView(view: SignUpScreen())
                    }, label: {
                        Text("SIGN UP")
                            .italic()
                            .font(.system(size: 13, weight: .light))
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

extension SignInScreen {
    private func validate(email: String, password: String) {
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
