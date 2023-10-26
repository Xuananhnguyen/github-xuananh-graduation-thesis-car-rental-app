//
//  MyProfileScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 27/11/2022.
//

import SwiftUI

struct MyProfileScreen: AppNavigator {
    @StateObject var viewModel = MyProfileViewModel()
    @State var fullname: String = ""
    @State var email: String = ""
    @State var phoneNumber: String = ""
    @State var address: String = ""
    
    var body: some View {
        BaseNavigationView(titleBackbutton: "Thông tin tài khoản",
                           builderContent: {
            VStack(spacing: 20) {
                    TextFieldView(title: "\("fullName".localized):",
                                  inputContent: $fullname)

                    TextFieldView(title: "\("email".localized):",
                                  inputContent: $email)

                    TextFieldView(title: "\("phoneNumber".localized):",
                                  inputContent: $phoneNumber)

                    TextFieldView(title: "\("address".localized):",
                                  inputContent: $address)
                
                
                Spacer()
                Button(action: {
                    viewModel.updateProfile(name: fullname,
                                            email: email,
                                            phoneNumber: phoneNumber,
                                            address: address)
                }, label: {
                    Text("Save Changes")
                        .textStyle(.ROBOTO_BOLD, size: 20)
                        .foregroundColor(Color(WHITE_FFFFFF))
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(Color(GREEN_2B4C59))
                        .cornerRadius(10)
                })
            }
            .padding(.horizontal, 16)
            .onChange(of: fullname) { newValue in
                fullname = newValue
            }
            .onChange(of: email) { newValue in
                email = newValue
            }
            .onChange(of: phoneNumber) { newValue in
                phoneNumber = newValue
            }
            .onChange(of: address) { newValue in
                address = newValue
            }
            .onTapGesture {
                self.dimissKeyBoard()
            }
        })
    }
}
