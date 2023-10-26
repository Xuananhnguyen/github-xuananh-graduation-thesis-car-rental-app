//
//  GetStartedScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 07/11/2022.
//

import SwiftUI

struct GetStartedScreen: AppNavigator {
    var clickGetStarted: (() -> Void)?
    
    var body: some View {
        NavigationView {
            ZStack {
                GeometryReader { geo in
                    Image(IMG_CAR_BACKGROUND)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                }
                .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    Image(IMG_TIIRA)
                        .scaledToFit()
                        .frame(width: 100, height: 40, alignment: .leading)
                        .padding(.top, 218)
                    
                    Divider()
                        .frame(width: 145, height: 8)
                        .background(Color(GREEN_2B4C59))
                        .padding(.top, 278)
                        .padding(.bottom, 11)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("sloganApp".localized)
                        .textStyle(.ROBOTO_BOLD, size: 26)
                        .foregroundColor(Color(WHITE_F6F6F6))
                        .multilineTextAlignment(.center)
                        .frame(height: 70, alignment: .center)
                        .padding(.horizontal, 26)
                    Spacer()
                    
                    HStack(spacing: 14){
                        GhostButton(title: "login".localized,
                                    font: TextStyle.ROBOTO_BOLD.font(size: 20),
                                    textColor: Color(WHITE_FFFFFF),
                                    strokeColor: Color(WHITE_FFFFFF),
                                    paddingVertical: 10,
                                    paddingHorizontal: 18,
                                    lineWidth: 2,
                                    cornerRadius: 10.0,
                                    onPress: {
                                        navigator.pushToView(view: SignInScreen())
                                    })
                        
                        GhostButton(title: "signUp".localized,
                                    font: TextStyle.ROBOTO_BOLD.font(size: 20),
                                    textColor: Color(WHITE_FFFFFF),
                                    strokeColor: Color(GREEN_2B4C59),
                                    paddingVertical: 12,
                                    paddingHorizontal: 33,
                                    lineWidth: 2,
                                    cornerRadius: 10.0,
                                    onPress: {
                                        navigator.pushToView(view: SignUpScreen())
                                    })
                    }
                    .padding(.bottom, 20)
                }
                .padding(.horizontal, 16)
            }
        }
    }
}
