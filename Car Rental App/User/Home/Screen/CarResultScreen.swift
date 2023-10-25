//
//  CarResultScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 18/11/2022.
//

import SwiftUI

struct CarResultScreen: AppNavigator {
    @StateObject var viewModel = CarResultViewModel()
    var startDay: Date?
    var endDay: Date?
    var brandID: String?
    var color: String?
    var year: String?
    var categoryID: String?
    
    var body: some View {
        BaseNavigationView(
            isHiddenBackButton: false,
            title: "titleSearchCar".localized,
            backgroundColor: Color(GRAY_EEEEEE),
            builderContent: {
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 16) {
                        if !viewModel.listCarResult.isEmpty {
                            ForEach(viewModel.listCarResult, id: \.self) { item in
                                CarPreviewView(imageCar: item.imageUrl ?? "",
                                               nameCar: item.vehicleName ?? "",
                                               price: item.rentalPricePerDay ?? 0,
                                               color: item.color ?? "",
                                               brand: item.brandName ?? "",
                                               category: item.categoryName ?? "") {
                                    navigator.pushToView(view: CarDetailScreen(vehicleID: item.vehicleId ?? 0,
                                                                               startDay: startDay ?? Date(),
                                                                               endDay: endDay ?? Date()))
                                }
                            }
                        } else {
                            EmptyView
                        }
                    }
                    .padding(16)
                }
                .background(Color(GRAY_EEEEEE).ignoresSafeArea(.all))
            })
        .onAppear {
            viewModel.carResult(startDay: startDay ?? Date(),
                                endDay: endDay ?? Date(),
                                brandID: brandID ?? "",
                                color: color ?? "",
                                year: year ?? "",
                                categoryID: categoryID ?? "")
        }
    }
}

extension CarResultScreen {
    private var EmptyView: some View {
        VStack {
            Text("noResult".localized)
        }
    }
}
