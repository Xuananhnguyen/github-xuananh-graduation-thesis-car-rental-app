//
//  AboutUsScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 02/12/2022.
//

import SwiftUI

struct AboutUsScreen: AppNavigator {
    let listIcon: [String] = [IC_PHONE_BLUE, IC_MAIL, IC_LOCATION]
    
    var body: some View {
        BaseNavigationView(title: "Về chúng tôi", builderContent: {
            VStack(spacing: 0) {
                Text("aboutUsTilte")
                    .textStyle(.ROBOTO_REGULAR, size: 19)
                    .foregroundColor(Color(GRAY_6B6B6B))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 50)
                
                Text("Liên hệ với chúng tôi")
                    .textStyle(.ROBOTO_REGULAR, size: 16)
                    .foregroundColor(Color(BLACK_000000))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 20)
                
                HStack(spacing: 23){
                    ForEach(listIcon.indices, id: \.self) { index in
                        let item = listIcon[index]
                        Image(item)
                            .resizable()
                            .frame(width: 23, height: 23, alignment: .center)
                            .frame(width: 83, height: 27)
                            .background(Color(GRAY_F6F6F6_52))
                            .cornerRadius(7)
                    }
                }
                .padding(.bottom, 47)
                
                Image(IMG_MAP)
                    .resizable()
                    .frame(maxWidth: 350)
                    .frame(height: 170)
                
             Spacer()
            }
            .padding(.horizontal, 16)
        })
    }
}
