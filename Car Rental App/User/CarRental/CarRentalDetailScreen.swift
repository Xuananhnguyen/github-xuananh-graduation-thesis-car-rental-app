//
//  CarRentalDetailScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 30/09/2023.
//

import SwiftUI

struct CarRentalDetailScreen: AppNavigator {
    @StateObject var viewModel = CarRentailDetailViewModel()
    var body: some View {
        VStack {
            BaseNavigationView {
                headerDetailView
            } builderContent: {
                carView
            }
            .onAppear {
               
            }
        }
    }
}

extension CarRentalDetailScreen {
    // MARK: Make Header
    var headerDetailView: some View {
        HStack {
            Image(IC_ARROW_LEFT)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color(BLACK_000000))
                .frame(width: 13, height: 21)
                .onTapGesture {
                    navigator.pop()
                }
            Text("settings".localized)
                .textStyle(.ROBOTO_BOLD, size: 23)
                .foregroundColor(Color(BLACK_000000))
            Spacer()
        }
        .padding(.horizontal, 16)
    }
    
    // MARK: Make Header
    var carView: some View {
        HStack {
            Image(IC_ARROW_LEFT)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color(BLACK_000000))
                .frame(width: 13, height: 21)
                .onTapGesture {
                    navigator.pop()
                }
            Text("settings".localized)
                .textStyle(.ROBOTO_BOLD, size: 23)
                .foregroundColor(Color(BLACK_000000))
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}


struct CarRentalDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        CarRentalDetailScreen()
    }
}
