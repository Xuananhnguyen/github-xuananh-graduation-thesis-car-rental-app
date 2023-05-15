//
//  ViewMoreScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 18/11/2022.
//

import SwiftUI
import VNavigator

struct ViewMoreScreen: AppNavigator {
    @StateObject var viewModel = HomeViewModel()
    @State var search: String = ""
    let columns = [GridItem(.flexible()),
                    GridItem(.flexible())]
    
    var body: some View {
        BaseNavigationView(
            isHiddenBackButton: false,
            builderHeader: {
                headerRender
            }, builderContent: {
                ScrollView(.vertical, showsIndicators: false){
                    VStack {
                        title
                        
                        LazyVGrid(columns: columns, spacing: 30) {
                            ForEach(viewModel.listCar.indices, id: \.self) { index in
                                let item = viewModel.listCar[index]
                                CarBoxView(name: item.nameCar ?? "",
                                           priceDay: item.priceDay ?? "",
                                           imageCar: item.image ?? "", onPressCar: {
                                    navigator.pushToView(view: CarDetailScreen(nameCar: item.nameCar ?? "",
                                                                               priceDay: item.priceDay ?? "",
                                                                               imageCar: item.image ?? ""))
                                })
                            }
                        }
                        .padding(.top, 35)
                    }
                }
                .padding(.horizontal, 16)
            })
    }
}

extension ViewMoreScreen {
    private var headerRender: some View {
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
            
            SearchView(inputSearch: $search)
        }
        .padding(16)
    }
    
    private var title: some View {
        VStack(alignment: .leading, spacing: 11){
            Text("TRENDING")
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(Color(GREEN_2B4C59))
            
            Text("Cars")
                .font(.system(size: 15, weight: .regular))
                .foregroundColor(Color(BLUE_95BCCC))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 40)
        .padding(.horizontal, 24)
    }
}
