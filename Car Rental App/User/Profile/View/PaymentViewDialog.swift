//
//  PaymentViewDialog.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 29/10/2023.
//

import SwiftUI

struct PaymentViewDialog: View {
    var invoiceCode: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
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
            .padding(.bottom, 20)
            
            Text("Chủ tài khoản: NGUYEN XUAN ANH")
                .textStyle(.ROBOTO_REGULAR, size: 16)
                .foregroundColor(Color(BLACK_000000))
            
            Text("Ngân hàng: VietinBank")
                .textStyle(.ROBOTO_REGULAR, size: 16)
                .foregroundColor(Color(BLACK_000000))
            
            Text("Số tài khoản: 103871010304")
                .textStyle(.ROBOTO_REGULAR, size: 16)
                .foregroundColor(Color(BLACK_000000))
            
            if let userName = AppDataManager.shared.authenticate?.name, let phoneNumber = AppDataManager.shared.authenticate?.phoneNumber {
                Text("Nội dung chuyển khoản: \(userName) + \(phoneNumber) + \(invoiceCode)")
                    .textStyle(.ROBOTO_REGULAR, size: 16)
                    .foregroundColor(Color(BLACK_000000))
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        .frame(width: 300, height: 250, alignment: .center)
        .background(Color(WHITE_FFFFFF))
        .cornerRadius(10)
        .onTapGesture {
            self.dimissKeyBoard()
        }
    }
}
