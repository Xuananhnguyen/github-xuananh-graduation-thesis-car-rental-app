//
//  AdminHomeScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 30/09/2023.
//

import SwiftUI

struct AdminHomeScreen: AppNavigator {
    @StateObject var viewModel = AdminHomeViewModel()
    private var featureAdmin: [AdminManagerEnum] = [.accountManagement, .vehiclesManagement, .reservationManagement, .reviewManagement, .revenueManagement]
    
    var body: some View {
        BaseNavigationView(builderHeader: {
            topHeader
        }, builderContent: {
            VStack(spacing: 20){
                ForEach(featureAdmin, id: \.self) { item in
                    ButtonProfile(nameFeature: item.name,
                                  onPress: {
                        onPressFeature(featureAdmin: item)
                    })
                }
                
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
            }
            .padding(.top, 10)
            .padding(.bottom, 20)
        })
    }
    
    private var topHeader: some View {
        HStack(spacing: 0) {
            Image(IMG_CAR)
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.trailing, 13)
            
            Text("Admin: \(AppDataManager.shared.authenticate?.name ?? "EmptyName")")
                .textStyle(.ROBOTO_MEDIUM, size: 20)
                .foregroundColor(Color(WHITE_FFFFFF))
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 17)
        .background(Color(GREEN_2B4C59)).ignoresSafeArea(.all, edges: .bottom)
    }
    
    private func onPressFeature(featureAdmin: AdminManagerEnum) {
        switch featureAdmin {
        case .accountManagement:
            navigator.pushToView(view: AccountManagementScreen())
        case .vehiclesManagement:
            navigator.pushToView(view: VehiclesManagementScreen())
        case .reservationManagement:
            navigator.pushToView(view: ReservationManagementScreen())
        case .reviewManagement:
            navigator.pushToView(view: ReviewManagementScreen())
        case .revenueManagement:
            navigator.pushToView(view: RevenueManagementScreen())
        }
    }
}
