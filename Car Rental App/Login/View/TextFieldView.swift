//
//  TextFieldView.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 08/11/2022.
//

import SwiftUI

struct TextFieldView: View {
    @State var title: String = ""
    @Binding var inputContent: String
    var fontSizeTitle: CGFloat = 16
    var fontSytle: TextStyle = .ROBOTO_MEDIUM
    var icon: String = ""
    var lineColor: String = GREEN_2B4C59
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            if !title.isEmpty {
                Text(title)
                    .textStyle(fontSytle, size: 16)
                    .foregroundColor(Color(GREEN_2B4C59))
            }
            TextField(inputContent, text: $inputContent)
                .textStyle(fontSytle, size: 16)
                .foregroundColor(Color(GRAY_A1A1A1))
            Divider()
                .frame(height: 1)
                .background(Color(lineColor).opacity(0.5))
            if !icon.isEmpty {
                Image(icon)
                    .resizable()
                    .frame(width: 15, height: 17)
            }
        }
    }
}
