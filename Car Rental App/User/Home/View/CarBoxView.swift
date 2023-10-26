//
//  CarBoxView.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 16/11/2022.
//

import SwiftUI

struct CarBoxView: View {
    var name: String = "TOYOTA"
    var priceDay: String = "300,000"
    var imageCar: String = "IMG_TOYOTA"
    var onPressCar: (() -> Void)?

    var body: some View {
        VStack(spacing: 0){
            Image(imageCar)
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 90, alignment: .center)
            VStack(alignment: .leading, spacing: 8){
                Text(name.uppercased())
                    .font(.system(size: 11, weight: .light))
                    .foregroundColor(Color(GREEN_2B4C59))
                
                Text("$\(priceDay)/day")
                    .font(.system(size: 11, weight: .light))
                    .foregroundColor(Color(BLACK_000000))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 16)
        .frame(width: 155, height: 170)
        .background(Color(WHITE_FFFFFF))
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color(BLACK_000000), lineWidth: 1)
        )
        .onTapGesture {
            onPressCar?()
        }
        
    }
}

struct CarBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CarBoxView()
    }
}
