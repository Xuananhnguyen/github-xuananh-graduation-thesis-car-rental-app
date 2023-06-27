//
//  TextFieldCustom.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 11/12/2022.
//

import SwiftUI

struct TextFieldCustom: View {
    var title: String = "Card Number:"
    
    var body: some View {
        VStack(spacing: 5){
            HStack {
                Text(title)
                    .textStyle(.PT_SANS_REGULAR, size: 13)
                    .foregroundColor(Color(GRAY_838383))
                
            }
        }
    }
}

struct TextFieldCustom_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldCustom()
    }
}
