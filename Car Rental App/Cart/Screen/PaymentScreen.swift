//
//  PurchaseScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 08/12/2022.
//

import SwiftUI
import VNavigator

struct PaymentScreen: AppNavigator {
    var price: String = "650"
    
    var body: some View {
        BaseNavigationView {
            ScrollView {
                VStack {
                    Image(IC_SHOPPING_SUCCESS)
                        .resizable()
                        .frame(width: 106, height: 95, alignment: .center)
                        .padding(.vertical, 50)
                        .overlay {
                            Circle()
                                .strokeBorder(Color(GREEN_6AC649), lineWidth: 3)
                                .frame(width: 183, height: 178, alignment: .center)
                        }
                    
                    Text("Thank You")
                        .textStyle(.ROBOTO_MEDIUM, size: 24)
                        .foregroundColor(Color(GREEN_6AC649))
                        .padding(.top, 50)
                        .padding(.bottom, 19)
                    
                    HStack(spacing: 0){
                        Text("payment made".uppercased())
                            .textStyle(.ROBOTO_REGULAR, size: 16)
                            .foregroundColor(Color(GREEN_2B4C59))
                        Spacer()
                        
                        Text("$\(price)")
                            .textStyle(.ROBOTO_REGULAR, size: 17)
                            .foregroundColor(Color(GREEN_6AC649))
                    }
                    .padding(.bottom, 39)
                    
                    Text("Well done Your payment is Successfuly  done and your car is on its way.")
                        .textStyle(.ROBOTO_REGULAR, size: 18)
                        .foregroundColor(Color(GRAY_676767))
                        .padding(.bottom, 95)
                    Spacer()
                    Button(action: {}, label: {
                        Text("Track")
                            .textStyle(.ROBOTO_REGULAR, size: 20)
                            .foregroundColor(Color(GREEN_2B4C59))
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(GREEN_2B4C59), lineWidth: 2)
                            )
                            .padding(.bottom, 29)
                    })
                    
                    Button(action: {
                        navigator.popToView(HomeScreen.self)
                    }, label: {
                        Text("Go Back")
                            .textStyle(.ROBOTO_BOLD, size: 20)
                            .foregroundColor(Color(WHITE_FFFFFF))
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .background(Color(GREEN_2B4C59))
                            .cornerRadius(10)
                    })
                }
                .padding(.horizontal, 16)
                .background(Color(WHITE_FFFFFF).ignoresSafeArea())
            }
        }
    }
}

struct PaymentScreen_Previews: PreviewProvider {
    static var previews: some View {
        PaymentScreen()
    }
}
