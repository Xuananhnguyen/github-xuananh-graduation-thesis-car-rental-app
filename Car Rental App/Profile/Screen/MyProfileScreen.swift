//
//  MyProfileScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 27/11/2022.
//

import SwiftUI
import VNavigator

struct MyProfileScreen: AppNavigator {
    @StateObject var viewModel = MyProfileViewModel()
    @State var fullname: String = ""
    @State var email: String = ""
    @State var phoneNumber: String = ""
    @State var address: String = ""
    var body: some View {
        BaseNavigationView(builderContent: {
            VStack(spacing: 20) {
                Text("Profile")
                    .textStyle(.ROBOTO_BOLD, size: 24)
                    .foregroundColor(Color(BLACK_000000))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 10)
                
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
                    
                }, label: {
                    Text("Save Changes")
                        .textStyle(.INTER_BOLD, size: 20)
                        .foregroundColor(Color(WHITE_FFFFFF))
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(Color(GREEN_2B4C59))
                        .cornerRadius(10)
                })
            }
            .padding(.horizontal, 16)
        })
    }
}
