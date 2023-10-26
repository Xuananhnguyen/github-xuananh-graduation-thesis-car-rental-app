//
//  ButtonSelect.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 14/11/2022.
//

import SwiftUI

struct ButtonSelect: View {
    var name: String = ""
    @State var isSelected: Bool = false
    
    var body: some View {
        Button(action: {
            isSelected.toggle()
        }, label: {
            Text(name)
                .font(.system(size: 12, weight: isSelected ? .bold : .light))
                .foregroundColor(Color(isSelected ? WHITE_FFFFFF : BLACK_000000))
                .frame(width: 83, height: 26)
                .background(Color(isSelected ? GREEN_2B4C59 : WHITE_FFC0C0))
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(BLACK_000000), lineWidth: 1)
                )
        })
    }
}

struct ButtonSelect_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSelect()
    }
}
