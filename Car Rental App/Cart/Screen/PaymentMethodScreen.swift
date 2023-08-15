//
//  PaymentMethodScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 11/12/2022.
//

import SwiftUI
import VNavigator

struct PaymentMethodScreen: AppNavigator {
    @State var isrememerThisInfo: Bool = true
    @State var cardNumber: String = ""
    @State var expirationDate: String = ""
    @State var ccv: String = ""
    
    
    var body: some View {
        BaseNavigationView(builderHeader: {
            header
        }, builderContent: {
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .center, spacing: 0){
                    Image(IMG_CREDIT_CARD)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 20)
                    
                    VStack {
                        HStack {
                            Text("Card Number:")
                                .textStyle(.ROBOTO_REGULAR, size: 16)
                                .foregroundColor(Color(GRAY_838383))
                            Spacer()
                            TextField(cardNumber, text: $cardNumber)
                                .textStyle(.ROBOTO_REGULAR, size: 13)
                                .foregroundColor(Color(GRAY_838383))
                        }
                        
                        Divider()
                            .frame(height: 1)
                            .background(Color(GRAY_BECEDA))
                    }
                    .padding(.bottom, 20)
                    .padding(.horizontal, 16)
                    
                    VStack {
                        HStack {
                            Text("Expiration Date:")
                                .textStyle(.ROBOTO_REGULAR, size: 16)
                                .foregroundColor(Color(GRAY_838383))
                            Spacer()
                            TextField(expirationDate, text: $expirationDate)
                                .textStyle(.ROBOTO_MEDIUM, size: 13)
                                .foregroundColor(Color(GRAY_838383))
                        }
                        
                        Divider()
                            .frame(height: 1)
                            .background(Color(GRAY_BECEDA))
                    }
                    .padding(.bottom, 20)
                    .padding(.horizontal, 16)
                    
                    VStack {
                        HStack {
                            Text("CCV:")
                                .textStyle(.ROBOTO_REGULAR, size: 16)
                                .foregroundColor(Color(GRAY_838383))
                            
                            TextField(ccv, text: $ccv)
                                .textStyle(.ROBOTO_MEDIUM, size: 13)
                                .foregroundColor(Color(GRAY_838383))
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        Divider()
                            .frame(height: 1)
                            .background(Color(GRAY_BECEDA))
                    }
                    .padding(.bottom, 20)
                    .padding(.horizontal, 16)
                    
                    VStack {
                        Toggle(isOn: $isrememerThisInfo, label: {
                            Text("Rememer This Info:")
                                .font(.system(size: 16, weight: .light))
                                .foregroundColor(Color(GREEN_2B4C59))
                        })
                        .toggleStyle(SwitchToggleStyle(tint: .orange))
                        Divider()
                            .frame(height: 1)
                            .background(Color(GRAY_BECEDA))
                    }
                    .padding(.horizontal, 16)

                }
            }
            
            Button(action: {
            }, label: {
                Text("Pay")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color(WHITE_FFFFFF))
                    .frame(width: 349, height: 52)
                    .background(Color(GREEN_2B4C59))
                    .cornerRadius(10)
                    .padding(.top, 10)
            })
        })
        
    }
}


extension PaymentMethodScreen {
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
            
            Image(IC_THREE_DOT)
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
}
struct PaymentMethodScreen_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodScreen()
    }
}
