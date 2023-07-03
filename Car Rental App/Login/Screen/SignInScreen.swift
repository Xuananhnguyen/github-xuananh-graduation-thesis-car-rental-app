//
//  SignInScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 08/11/2022.
//

import SwiftUI
import VNavigator
import FirebaseAuth

struct SignInScreen: AppNavigator {
    @State var email: String = ""
    @State var password: String = ""
    
    @State private var isDisable: Bool = true
    
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
                        Text("Sign In")
                            .textStyle(.IMPRIMA_REGULAR, size: 50)
                            .foregroundColor(Color(BLACK_000000))
                            .padding(.bottom, 20)
                        
                        VLine()
                            .background(Color(GREEN_2B4C59))
                            .frame(width: 58, height: 4, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 60)
                    
                    TextFieldView(title: "Email or phone".uppercased(),
                                  inputContent: $email)
                    .padding(.bottom, 28)
                    
                    SecureTextFieldView(title: "Password".uppercased(),
                                        inputContent: $password)
                    
                    Button(action: {
                        UIApplication.shared.endEditing()
                    }, label: {
                        Text("Forgot password?")
                            .textStyle(.INTER_REGULAR, size: 15)
                            .foregroundColor(Color(BLACK_000000))
                            .padding(.top, 12)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    })
                    .padding(.bottom, 60)
                    
                    Button(action: {
                        validate(email: email, password: password)
//                        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { authResult, error in
//                            guard let result = authResult, error == nil else {
//                                print("Failed to log in user with email: \(email)")
//                                return
//                            }
//
//                            let user = result.user
//                            print("Logged In User: \(user)")
//                        })
                        UIApplication.shared.endEditing()
                    }, label: {
                        Text("Login".uppercased())
                            .textStyle(.INTER_BOLD, size: 20)
                            .foregroundColor(Color(WHITE_FFFFFF))
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .background(Color(GREEN_2B4C59))
                            .cornerRadius(10)
                    })
                    .padding(.bottom, 30)
                    
                    HStack(spacing: 0){
                        Text("Don’t Have an account yet?")
                            .textStyle(.INTER_REGULAR, size: 15)
                            .foregroundColor(Color(BLACK_000000))
                        Spacer()
                        Button(action: {
                            UIApplication.shared.endEditing()
                            navigator.pushToView(view: SignUpScreen())
                        }, label: {
                            Text("Sign Up".uppercased())
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
