//
//  StatusToast.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 11/10/2023.
//

import SwiftUI

struct StatusToast: View {
    var isHidenIcon: Bool = false
    var icon: Image = Image(IC_SUCCESS)
    var status: String = ""
    var body: some View {
        HStack {
            if !isHidenIcon {
                icon.frame(width: 24, height: 24)
                    .fixedSize()
            }
            Text(status)
                .foregroundColor(Color(GREEN_2B4C59))
                .textStyle(.ROBOTO_MEDIUM, size: 12)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 8)
        .frame(width: Utils.screenWidth * 0.8)
        .background(Color(WHITE_F6F6F6))
        .cornerRadius(8)
    }
}

struct StatusToast_Previews: PreviewProvider {
    static var previews: some View {
        StatusToast(
            icon:  Image(IC_SUCCESS),
            status: "This is status messgae"
        )
    }
}

