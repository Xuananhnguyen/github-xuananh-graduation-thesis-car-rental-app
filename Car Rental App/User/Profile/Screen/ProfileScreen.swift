//
//  ProfileScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 20/11/2022.
//

import SwiftUI

@MainActor
struct ProfileScreen: AppNavigator {
    @StateObject var viewModel = ProfileViewModel()
    var feature: [ProfileType] = [.myProfile, .settings, .helpAndInfo, .carRental]
    
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false, builderHeader: {
            header
        }, builderContent: {
            VStack {
                VStack(spacing: 20){
                    ForEach(feature.indices, id: \.self) { index in
                        let item = feature[index]
                        ButtonProfile(image: item.icon,
                                      nameFeature: item.name,
                                      onPress: {
                            onPressFeature(feature: item)
                        })
                    }
                }
                Spacer()
                
                Button(action: {
                    AppViewModel.shared.handleLogout {
                        navigator.popToRootView()
                    }
                }, label: {
                    Text("logOut".localized)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(WHITE_FFFFFF))
                        .frame(width: 349, height: 52)
                        .background(Color(GREEN_2B4C59))
                        .cornerRadius(10)
                })
                .padding(.bottom, 20)
            }
            .background(Color(WHITE_FFFFFF).ignoresSafeArea())
        })
    }
}

extension ProfileScreen {
    private var header: some View {
        HStack(spacing: 0){
            Image(IC_ARROW_LEFT)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color(GREEN_2B4C59))
                .frame(width: 13, height: 21)
                .onTapGesture {
                    navigator.pop()
                }
            
            Spacer()
        }
        .padding(.top, 25)
        .padding(.bottom, 6)
        .padding(.horizontal, 16)
    }
    
    private func onPressFeature(feature: ProfileType) {
        switch feature {
        case .myProfile:
            navigator.pushToView(view: MyProfileScreen(fullname: "",
                                                       email: "",
                                                       phoneNumber: "",
                                                       address: ""))
        case .helpAndInfo:
            navigator.pushToView(view: AboutUsScreen())
        case .settings:
            navigator.pushToView(view: SettingScreen())
        case .carRental:
            navigator.pushToView(view: CarRentalScreen())
        }
    }
}
