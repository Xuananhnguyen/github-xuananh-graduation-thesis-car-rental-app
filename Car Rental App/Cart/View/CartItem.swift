//
//  CartItem.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 01/12/2022.
//

import SwiftUI

struct CartItem: View {
    var imageCar: String = IMG_TESLA
    var nameCar: String = "TESLA"
    var price: Int = 0
    @State var quality: Int = 1
    var onPressDelete: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 6){
            HStack(spacing: 0){
                Image(imageCar)
                    .resizable()
                    .frame(width: 157, height: 99)
                    .padding(.trailing, 22)
                
                VStack(alignment: .leading, spacing: 6){
                    Text(nameCar)
                        .textStyle(.PT_Sans, size: 11)
                        .foregroundColor(Color(GREEN_2B4C59))
                    Text("$ \(price)")
                        .textStyle(.PT_Sans, size: 11)
                        .foregroundColor(Color(RED_C64949))
                    qualityView
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
                .frame(height: 1)
                .background(Color(GRAY_BECEDA))
        }
    }
}

extension CartItem {
   private var qualityView: some View {
        HStack {
            Button(action: {
                    quality += 1
            }, label: {
                Image(IC_PLUS)
                    .renderingMode(.template)
                    .foregroundColor(Color(GREEN_2B4C59))
                    .frame(width: 5, height: 5)
            })
            
            Text("\(quality)")
                .textStyle(.Roboto, size: 12)
                .foregroundColor(Color(GREEN_2B4C59))
                .padding(.horizontal, 10)
            
            Button(action: {
                if quality > 0 {
                    quality -= 1
                }
            }, label: {
                Image(IC_MINUS)
                    .renderingMode(.template)
                    .foregroundColor(Color(GREEN_2B4C59))
                    .frame(width: 5, height: 5)
            })
            .padding(.trailing, 20)
            
            Button(action: {
                onPressDelete?()
            }, label: {
                Text("Delete")
                    .textStyle(.PT_Sans, size: 10)
                    .foregroundColor(Color(BROWN_988080))
                    .frame(width: 44, height: 11, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(BROWN_988080), lineWidth: 1)
                    )
                
            })
        }
    }
}

