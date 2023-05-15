//
//  HomeScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 13/11/2022.
//

import SwiftUI
import VNavigator

struct HomeScreen: AppNavigator {
    @StateObject var viewModel = HomeViewModel()
    let columns = [GridItem(.flexible()),
                    GridItem(.flexible())]
    
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false,
                           backgroundColor: Color(WHITE_FFFFFF),
                           builderHeader: {
            topHeader
        }, builderContent: {
            VStack(spacing: 0){
                Image(IMG_SALE)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 357, height: 158, alignment: .center)
                    .padding(.top, 10)
                    .padding(.bottom, 30)

                
                ScrollView(.vertical, showsIndicators: false) {
                    Text("Cars Available Near You")
                        .font(.system(size: 20, weight: .light))
                        .foregroundColor(Color(BLACK_000000))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 4)
                    
                    Text("View more")
                        .font(.system(size: 12, weight: .light))
                        .foregroundColor(Color(RED_C64949))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .onTapGesture {
                            navigator.pushToView(view: ViewMoreScreen())
                        }
                    
                    LazyVGrid(columns: columns, spacing: 30) {
                        ForEach(viewModel.listCarPrefix.indices, id: \.self) { index in
                            let item = viewModel.listCarPrefix[index]
                            CarBoxView(name: item.nameCar ?? "",
                                       priceDay: item.priceDay ?? "",
                                       imageCar: item.image ?? "",
                                       onPressCar: {
                                navigator.pushToView(view: CarDetailScreen(nameCar: item.nameCar ?? "",
                                                                           priceDay: item.priceDay ?? "",
                                                                           imageCar: item.image ?? ""))
                            })
                        }
                    }
                    .padding(.top, 35)
                }
                .padding(.horizontal, 16)
            }
            .onAppear {
                viewModel.listPrefixCar()
            }
        })
    }
}

extension HomeScreen {
    private var topHeader: some View {
        HStack(spacing: 0) {
            Button(action: {
                navigator.pushToView(view: ProfileScreen())
            }, label: {
                Image(IC_THREE_LINE)
                    .resizable()   
                    .frame(width: 27, height: 17.5)
            })
            .frame(width: 41, height: 35, alignment: .center)
            Spacer()
        }
        .padding(16)
        .background(Color(WHITE_F6F6F6)).ignoresSafeArea(.all, edges: .bottom)
    }
    
    private var typeOfCarView: some View {
        HStack(spacing: 21) {
            ForEach(viewModel.listTypeCar.indices, id: \.self) { index in
                let item = viewModel.listTypeCar[index]
                HStack(spacing: 20) {
                    ButtonSelect(name: item.name ?? "",
                                 isSelected: item.isSeleted ?? false)
                }
            }
        }
        .padding(.top, 30)
        .padding(.bottom, 30)
    }
}
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
