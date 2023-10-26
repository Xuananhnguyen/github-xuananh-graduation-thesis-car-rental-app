//
//  CarPreviewView.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 13/08/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct CarPreviewView: View {
    var imageCar: String
    var nameCar: String
    var price: Int
    var color: String
    var brand: String
    var category: String
    var onPress: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            if let img = URL(string: imageCar) {
                WebImage(url: img)
                    .resizable()
                    .frame(height: 200)
                    .padding(.bottom, 15)
            }
            
            VStack(alignment: .leading, spacing: 10){
                Divider()
                    .frame(height: 1)
                    .background(Color(GREEN_2B4C59))
                
                Text(nameCar.uppercased())
                    .textStyle(.ROBOTO_MEDIUM, size: 18)
                
                Text("Giao xe tận nơi")
                    .textStyle(.ROBOTO_MEDIUM, size: 13)
                    .foregroundColor(Color(GREEN_2B4C59))
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    .frame(height: 22)
                    .background(Color(GRAY_EEEEEE))
                    .cornerRadius(3)
                
                Text("Loại xe: \(category)")
                    .textStyle(.ROBOTO_REGULAR, size: 14)
                
                Text("Hãng xe: \(brand)")
                    .textStyle(.ROBOTO_REGULAR, size: 14)
                
                HStack(spacing: 0){
                    Text("Màu xe: \(color)")
                        .textStyle(.ROBOTO_REGULAR, size: 14)
                    Spacer()
                    Text("Giá thuê: \(price) VND/ngày")
                        .textStyle(.ROBOTO_MEDIUM, size: 14)
                }
            }
            .foregroundColor(Color(BLACK_000000))
            .padding(EdgeInsets(top: 10, leading: 13, bottom: 10, trailing: 16))
        }
        .background(Color(WHITE_FFFFFF))
        .cornerRadius(10)
        .onTapGesture {
            onPress?()
        }
    }
}
