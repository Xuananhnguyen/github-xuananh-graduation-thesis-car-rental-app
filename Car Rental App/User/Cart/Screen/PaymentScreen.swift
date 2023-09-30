//
//  PurchaseScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 08/12/2022.
//

import SwiftUI

struct SuccessScreen: AppNavigator {
    @StateObject var viewModel = SuccessViewModel()
    var body: some View {
        BaseNavigationView(isHiddenBackButton: true,
                           backgroundColor: Color(GRAY_EEEEEE)) {
            VStack(spacing: 0){
                Image(IC_SHOPPING_SUCCESS)
                    .resizable()
                    .frame(width: 106, height: 95, alignment: .center)
                    .padding(.vertical, 50)
                    .overlay {
                        Circle()
                            .strokeBorder(Color(GREEN_6AC649), lineWidth: 3)
                            .frame(width: 183, height: 178, alignment: .center)
                    }
                    .padding(.top, 50)
                
                Text("successTitle".localized)
                    .textStyle(.ROBOTO_BOLD, size: 18)
                    .foregroundColor(Color(GREEN_6AC649))
                Spacer()
                ButtonAuth(title: "showmore".localized,
                           textColor: Color(GREEN_2B4C59),
                           backgroundColor: Color(WHITE_FFFFFF),
                           onPress: {
                    navigator.popToView(HomeScreen.self)
                }).overlay(
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(GREEN_2B4C59), lineWidth: 2))
                .padding(.bottom, 20)
                
                ButtonAuth(title: "backToHome".localized,
                           onPress: {
                    navigator.popToView(HomeScreen.self)
                })
            }
            .padding(.horizontal, 16)
            .background(Color(GRAY_EEEEEE).ignoresSafeArea(.all))
        }
    }
}
