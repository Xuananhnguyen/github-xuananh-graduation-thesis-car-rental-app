//
//  SearchBar.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 31/07/2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false

    var body: some View {
        HStack(spacing: 0){
            TextField("carRentalLocation".localized, text: $text)
                .textStyle(.ROBOTO_MEDIUM, size: 18)
                .padding(.vertical, 13)
                .padding(.horizontal, 15)
                .onTapGesture {
                    self.isEditing = true
                }
            Spacer()
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Image(IC_CANCEL)
                        .resizable()
                        .frame(width: 18, height: 18)
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
            }
        }
        .background(Color(GRAY_D9D9D9))
        .cornerRadius(10)
    }
}
