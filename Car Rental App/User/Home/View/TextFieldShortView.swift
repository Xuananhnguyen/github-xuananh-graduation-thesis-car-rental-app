//
//  TextFieldShortView.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 25/10/2023.
//

import SwiftUI

struct TextFieldShortView: View {
    @State var title: String = ""
    @Binding var inputContent: String
    
    var body: some View {
        HStack(spacing: 5) {
            if !title.isEmpty {
                Text(title)
                    .textStyle(.ROBOTO_MEDIUM, size: 16)
                    .foregroundColor(Color(GREEN_2B4C59))
            }
            Text("-")
            TextField(inputContent, text: $inputContent)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .frame(width: 120, height: 40)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 2)
                }
                .keyboardType(.numberPad)
        }
        .foregroundColor(Color(GREEN_2B4C59))
    }
}
