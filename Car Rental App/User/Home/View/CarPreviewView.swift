//
//  CarPreviewView.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 13/08/2023.
//

import SwiftUI

struct CarPreviewView: View {
    var imageCar: String = CAR_IMG
    var nameCar: String = "MITSUBISHI XPANDER 2021"
    var address: String = "Hà Đông, Hà Nội"
    var price: String = "950000"
    var onPress: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            Image(imageCar)
                .resizable()
                .frame(height: 170)
                .padding(.bottom, 15)
            
            VStack(alignment: .leading, spacing: 17){
                Text(nameCar.uppercased())
                    .textStyle(.ROBOTO_MEDIUM, size: 18)
                    .foregroundColor(Color(GREEN_2B4C59))
                
                Divider()
                    .frame(height: 1)
                    .background(Color(GREEN_2B4C59))
                
                HStack(spacing: 6){
                    Image(IC_LOCATION_BLACK)
                        .resizable()
                        .frame(width: 11.5, height: 17.5)
                    Text(address)
                        .textStyle(.ROBOTO_REGULAR, size: 13)
                        .foregroundColor(Color(GREEN_2B4C59))
                    Spacer()
                    Text("\(price) VND/ngày")
                        .textStyle(.ROBOTO_REGULAR, size: 13)
                        .foregroundColor(Color(GREEN_2B4C59))
                }
            }
            .padding(EdgeInsets(top: 15, leading: 20, bottom: 13, trailing: 20))
        }
        .background(Color(WHITE_FFFFFF))
        .cornerRadius(10)
        .onTapGesture {
            onPress?()
        }
    }
}

struct CarPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        CarPreviewView()
    }
}
