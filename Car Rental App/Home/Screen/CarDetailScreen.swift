 //
//  CarDetailScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 18/11/2022.
//

import SwiftUI
import VNavigator

struct CarDetailScreen: AppNavigator {
    @State var nameCar: String = "Range Rover"
    @State var brandCar: String = "Range Rover"
    @State var decription: String = "Range Rover"
    @State var priceDay: String = "200,000"
    @State var imageCar: String = IMG_RANGE_ROVER_BIG
    @State var quality: Int = 1
    
    var body: some View {
        BaseNavigationView(
            isHiddenBackButton: false,
            builderHeader: {
                headerRender
            }, builderContent: {
                VStack(spacing: 0){
                    ScrollView(.vertical, showsIndicators: false){
                        Image(imageCar)
                            .scaledToFit()
                            .frame(width: 300, height: 256, alignment: .center)
                            .padding(.top, 75)
                        
                        HStack(spacing: 1){
                            VStack(alignment: .leading, spacing: 0){
                                Text("Name: \(nameCar)")
                                    .font(.custom("Roboto", size: 16))
                                    .foregroundColor(Color(BLACK_000000))
                                
                                Text("Brand: \(brandCar)")
                                    .font(.custom("Roboto", size: 16))
                                    .foregroundColor(Color(BLACK_000000))
                                
                                Text("Decription: \(decription)")
                                    .font(.custom("Roboto", size: 16))
                                    .foregroundColor(Color(BLACK_000000))
                            }
                            Spacer()
                            Text("Price: \(priceDay)VND/Day")
                                .font(.custom("PT Sans", size: 12))
                                .foregroundColor(Color(RED_C64949))
                        }
                        .padding(.top, 26)
                        .padding(.bottom, 40)
                        carDecription
                    }
                    
                    bookNow
                }
                .padding(.horizontal, 16)
                .background(Color(WHITE_FFFFFF).ignoresSafeArea(.all, edges: .bottom))
            })
    }
}


extension CarDetailScreen {
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
            
            Image(IC_THREE_DOT)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color(GREEN_2B4C59))
                .frame(width: 30, height: 32)
                .onTapGesture {}
        }
        .padding(.top, 25)
        .padding(.horizontal, 16)
    }
    
    private var carDecription: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 15){
                VStack(spacing: 8){
                    Text("Brand")
                        .font(.custom("PT Sans", size: 12))
                        .foregroundColor(Color(BLUE_95BCCC))
                        .bold()
                    Text("Automatic")
                        .font(.custom("PT Sans", size: 12))
                        .foregroundColor(Color(BLACK_000000))
                }
                .padding(EdgeInsets(top: 14, leading: 49, bottom: 33, trailing: 49))
                .frame(width: 155, height: 89, alignment: .center)
                .background(Color(WHITE_F6F6F6))
                .cornerRadius(3)
                
                VStack(spacing: 8){
                    Text("Speed")
                        .font(.custom("PT Sans", size: 12))
                        .foregroundColor(Color(BLUE_95BCCC))
                    Text("200kmph")
                        .font(.custom("PT Sans", size: 12))
                        .foregroundColor(Color(BLACK_000000))
                }
                .padding(EdgeInsets(top: 14, leading: 49, bottom: 33, trailing: 49))
                .frame(width: 155, height: 89, alignment: .center)
                .background(Color(WHITE_F6F6F6))
                .cornerRadius(3)
            }
        }
    }
    
    private var bookNow: some View {
        HStack(spacing: 0){
            Button(action: {
                navigator.pushToView(view: PaymentMethodScreen())
            }, label: {
                Text("BOOK NOW")
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(Color(WHITE_FFFFFF))
                    .frame(height: 52)
                    .frame(maxWidth: .infinity)
                    .background(Color(BLACK_000000))
                    .cornerRadius(10)
            })
        }
        .padding(.top, 33)
    }
}
