//
//  ButtonProfile.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 21/11/2022.
//

import SwiftUI

struct ButtonProfile: View {
    var image: String = ""
    var nameFeature: String = ""
    var onPress: (() -> Void)?
    
    var body: some View {
        HStack {
            if !image.isEmpty {
                Image(image)
                    .frame(width: 24, height: 23)
                Spacer()
            }
            
            Text(nameFeature)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(Color(GREEN_2B4C59))
            Spacer()
            
            Image(IC_ARROW_RIGHT_GREEN)
                .resizable()
                .frame(width: 13, height: 21)
        }
        .padding(EdgeInsets(top: 9, leading: 12, bottom: 9, trailing: 12))
        .frame(width: 350, height: 46)
        .background(Color(WHITE_F6F6F6))
        .cornerRadius(10)
        .onTapGesture {
            onPress?()
        }
    }
}

