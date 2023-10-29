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
    private var feature: [ProfileType] = [.myProfile, .license, .carRental, .settings, .helpAndInfo]
    
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false,
                           title: "Hồ sơ người dùng",
                           builderHeader: {
        }, builderContent: {
            VStack {
                VStack(spacing: 20){
                    ForEach(feature, id: \.self) { item in
                        ButtonProfile(nameFeature: item.name,
                                      onPress: {
                            onPressFeature(feature: item)
                        })
                    }
                }
                .padding(.top, 10)
                Spacer()
                
                Button(action: {
                    AppViewModel.shared.handleLogout {
                        navigator.popToRootView()
                    }
                }, label: {
                    Text("logOut".localized)
                        .textStyle(.ROBOTO_BOLD, size: 20)
                        .foregroundColor(Color(WHITE_FFFFFF))
                        .frame(width: 349, height: 52)
                        .background(Color(GREEN_2B4C59))
                        .cornerRadius(10)
                })
                .padding(.bottom, 20)
            }
            .background(Color(WHITE_FFFFFF).ignoresSafeArea())
            .onAppear {
                viewModel.userProfile()
                viewModel.geUserLicense()
            }
        })
    }
}

extension ProfileScreen {
    private func onPressFeature(feature: ProfileType) {
        switch feature {
        case .myProfile:
            navigator.pushToView(view: MyProfileScreen(fullname: viewModel.userProfileModel?.name ?? "",
                                                       email: viewModel.userProfileModel?.email ?? "",
                                                       phoneNumber: viewModel.userProfileModel?.phoneNumber ?? "",
                                                       address: viewModel.userProfileModel?.address ?? "") )
        case .license:
            navigator.pushToView(view: LisenceScreen(idCard: viewModel.userLicense?.idCard ?? "",
                                                    drivingLicense: viewModel.userLicense?.drivingLicense ?? ""))
        case .carRental:
            navigator.pushToView(view: ReservationScreen())
        case .settings:
            navigator.pushToView(view: ChangePasswordScreen())
        case .helpAndInfo:
            navigator.pushToView(view: AboutUsScreen())
        }
    }
}
