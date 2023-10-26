//
//  VehiclesManagementScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 24/10/2023.
//

import SwiftUI

struct VehiclesManagementScreen: AppNavigator {
    @StateObject var viewModel = VehiclesManagementViewModel()
    
    var body: some View {
        BaseNavigationView(
            isHiddenBackButton: false,
            title: "Quản lý xe",
            backgroundColor: Color(GRAY_EEEEEE),
            builderContent: {
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 16) {
                        ForEach(viewModel.listCar.indices, id: \.self) { index in
                            let item = viewModel.listCar[index]
                            CarPreviewView(imageCar: item.imageUrl ?? "",
                                           nameCar: item.vehicleName ?? "",
                                           price: item.rentalPricePerDay ?? 0,
                                           color: item.color ?? "",
                                           brand: item.brandName ?? "",
                                           category: item.categoryName ?? "") {
                                navigator.pushToView(view: VehiclesDetailScreen(imageUrl: item.imageUrl ?? "",
                                                                                vehicleName: item.vehicleName ?? "",
                                                                                brandName: item.brandName ?? "",
                                                                                categoryName: item.categoryName ?? "",
                                                                                color: item.color ?? "",
                                                                                rentalPricePerDay: item.rentalPricePerDay ?? 0,
                                                                                limitedKmPerDay: item.limitedKmPerDay ?? 0,
                                                                                description: item.description ?? "",
                                                                                collateral: item.collateral ?? ""))
                            }
                        }
                    }
                    .padding(16)
                }
                .background(Color(GRAY_EEEEEE).ignoresSafeArea(.all))
            })
        .onAppear {
            viewModel.getAllCar()
        }
    }
}
