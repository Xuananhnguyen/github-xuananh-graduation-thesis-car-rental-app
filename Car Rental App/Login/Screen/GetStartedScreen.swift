//
//  GetStartedScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 07/11/2022.
//

import SwiftUI
import VNavigator

struct GetStartedScreen: AppNavigator {
    private let carBackground: String = "car_background"
    private let title1: String = "Rent your dream car from the"
    private let title2: String = "Best Company"
    var clickGetStarted: (() -> Void)?
    
    var body: some View {
        NavigationView {
            ZStack {
                GeometryReader { geo in
                    Image(carBackground)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                }
                .edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        Image(IMG_TIIRA)
                            .scaledToFit()
                            .frame(width: 100, height: 40, alignment: .leading)
                            .padding(.top, 218)
                        
                        Divider()
                            .frame(width: 145, height: 8)
                            .background(Color("GREEN_2B4C59"))
                            .padding(.top, 278)
                            .padding(.bottom, 11)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(title1)
                            .font(.system(size: 26, weight: .bold))
                            .foregroundColor(Color("WHITE_F6F6F6"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(title2)
                            .font(.system(size: 26, weight: .bold))
                            .foregroundColor(Color("WHITE_F6F6F6"))
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Button(action: {
                            clickGetStarted?()
                            navigator.pushToView(view: SignInScreen())
                        }, label: {
                            HStack {
                                Text("Get Started")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(Color("WHITE_FFFFFF"))
                                Image("IC_ARROW_RIGHT")
                                    .resizable()
                                    .frame(width: 7, height: 8)
                            }
                            .frame(width: 243, height: 52)
                            .background(Color("RED_C64949"))
                            .cornerRadius(50)
                        })
                        .padding(.top, 70)
                        .padding(.bottom, 80)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}
