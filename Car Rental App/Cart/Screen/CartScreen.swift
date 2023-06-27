//
//  CartScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 30/11/2022.
//

import SwiftUI
import VNavigator

struct CartScreen: AppNavigator {
    @State var viewModel = CartViewModel()
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false, builderHeader: {
            header
        }, builderContent: {
            VStack(alignment: .leading, spacing: 0){
                
                Text("My Chart")
                    .textStyle(.ROBOTO_REGULAR, size: 20)
                    .foregroundColor(Color(BLACK_000000))
                    .padding(.vertical, 25)
                    .frame(maxWidth: .infinity, alignment: .leading)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20){
                        ForEach(viewModel.cartList.indices, id: \.self) { index in
                            let item = viewModel.cartList[index]
                            CartItem(imageCar: item.image ?? "",
                                     nameCar: item.name ?? "",
                                     price: item.price ?? 0,
                                     quality: item.quality ?? 0,
                                     onPressDelete: {})
                        }
                    }
                }
                buttonNext
            }
            .padding(.horizontal, 16)
            .background(Color(WHITE_FFFFFF).ignoresSafeArea(.all, edges: .bottom))
        })
    }
}

struct CartScreen_Previews: PreviewProvider {
    static var previews: some View {
        CartScreen()
    }
}

extension CartScreen {
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
            
            Image(IC_CART)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color(GREEN_2B4C59))
                .frame(width: 41, height: 39)
                .onTapGesture {
                    
                }
        }
        .padding(.top, 25)
        .padding(.bottom, 6)
        .padding(.horizontal, 16)
    }
    
    private var buttonNext: some View {
        Button(action: {
            navigator.pushToView(view: PaymentMethodScreen())
        }, label: {
            Text("Next")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color(WHITE_FFFFFF))
                .frame(width: 349, height: 52)
                .background(Color(GREEN_2B4C59))
                .cornerRadius(10)
                .padding(.top, 10)
        })
    }
    
}
 
