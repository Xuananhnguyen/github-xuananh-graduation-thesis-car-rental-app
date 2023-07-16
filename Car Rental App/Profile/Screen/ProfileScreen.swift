//
//  ProfileScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 20/11/2022.
//

import SwiftUI
import VNavigator

@MainActor
struct ProfileScreen: AppNavigator {
    @StateObject var viewModel = ProfileViewModel()
    @State var nameUser: String = "User Demo"
    var feature: [ProfileType] = [.myProfile, .settings, .helpAndInfo, .notification, .privacy]
    
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false, builderHeader: {
            header
        }, builderContent: {
            VStack {
                ScrollView(.vertical, showsIndicators: false){
                    Image(IMG_CAR)
                        .resizable()
                        .frame(width: 103, height: 101)
                        Text(viewModel.user?.fullName ?? "")
                            .textStyle(.ROBOTO_BOLD, size: 20)
                            .foregroundColor(Color(GRAY_6B6B6B))
                    
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
                    .padding(.bottom, 80)
                    
                    Button(action: {
                        Task {
                            do {
                                try viewModel.signOut()
                                print("Logout success")
                                navigator.popToRootView()
                            } catch {
                                print(error)
                            }
                        }
                    }, label: {
                        Text("Log Out")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color(WHITE_FFFFFF))
                            .frame(width: 349, height: 52)
                            .background(Color(GREEN_2B4C59))
                            .cornerRadius(10)
                    })
                }
                .task {
                    try? await viewModel.loadCurrentUser()
                }
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
            navigator.pushToView(view: MyProfileScreen(fullname: viewModel.user?.fullName ?? "",
                                                       email: viewModel.user?.email ?? "",
                                                       phoneNumber: viewModel.user?.phoneNumber ?? "",
                                                       address: viewModel.user?.address ?? ""))
        case .helpAndInfo:
            navigator.pushToView(view: AboutUsScreen())
        case .settings:
            navigator.pushToView(view: SettingScreen())
        case .notification, .privacy:
            return Popup.presentPopup(alertView: ConfirmDialog(content: "Comming Soon"))
        }
    }
}
