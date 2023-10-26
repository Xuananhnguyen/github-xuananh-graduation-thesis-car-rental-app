//
//  AccountVerifiedDialog.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 25/10/2023.
//

import SwiftUI

struct AccountVerifiedDialog: AppNavigator {
    var confirmAction: (() -> Void)? = nil
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            HStack(spacing: 0){
                Image(systemName: "xmark")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(GREEN_2B4C59))
                    .frame(width: 24, height: 24)
                    .onTapGesture {
                        Popup.dismiss()
                    }
            }
            .expandedWidth(alignment: .leading)
            Image(IMG_WARNING_SIGN)
                .resizable()
                .frame(width: 107, height: 107)
            
            Text("Tài khoản chưa xác thực")
                .textStyle(.ROBOTO_MEDIUM, size: 20)
                .foregroundColor(Color(BLACK_000000))
            
            Text("Bạn cần cập nhật GPLX và CCCD \n để có thể đặt xe")
                .multilineTextAlignment(.center)
                .textStyle(.ROBOTO_REGULAR, size: 16)
                .foregroundColor(Color(GRAY_A1A1A1))
            ButtonAuth(title: "Xác thực ngay", onPress: {
                Popup.dismiss {
                    confirmAction?()
                }
            })
            .padding(.horizontal, 16)
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        .frame(width: 300, height: 350, alignment: .center)
        .background(Color(WHITE_FFFFFF))
        .cornerRadius(10)
    }
}

struct AccountVerifiedDialog_Previews: PreviewProvider {
    static var previews: some View {
        AccountVerifiedDialog()
    }
}
