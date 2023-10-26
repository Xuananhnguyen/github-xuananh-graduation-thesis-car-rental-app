//
//  BaseAlertBuilder.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 12/08/2023.
//

import SwiftUI

struct BaseAlertBuilder: AppNavigator {
    var message: String = "Tính năng này đang được phát triển và sẽ sớm hoàn thiện. Quay lại sau bạn nha!"
    var titleButton: String = "Tôi sẽ quay lại sau"
    var isPopupSuccess: Bool = false
    var onPress: () -> Void
    var body: some View {
        VStack(spacing: 0) {
            
            if !isPopupSuccess {
                ZStack(alignment: .topTrailing) {
                    Image("img_oppps")
                        .resizable()
                        .frame(width: .infinity, height: 200)
    //                    .background(.yellow)
                    Image("ic_close")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .onTapGesture {
                            PopupHelper.dismiss()
                        }
                    
                }
    //            .padding(.leading, 24)
                Text("Oppps!")
                    .foregroundColor(Color(.orange))
                    .font(.system(size: 18))
            }
            
            Text(message)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.black))
                .font(.system(size: 14))
                .padding(.vertical, 16)
            
            Button {
                onPress()
            } label: {
                Text(titleButton)
                    .foregroundColor(Color(.black))
                    .font(.system(size: 12))
                    .frame(width: 146, height: 33)
                    .background(Color(.orange))
                    .cornerRadius(21)
                    .padding(.top, 15)
                
            }

        }
        .padding(16)
        .background(Color(.white))
        .cornerRadius(12)
        .padding(.horizontal, 33)
    }
}

struct BaseAlertBuilder_Previews: PreviewProvider {
    static var previews: some View {
        BaseAlertBuilder {
            
        }
    }
}
