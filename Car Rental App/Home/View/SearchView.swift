//
//  SearchView.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 20/11/2022.
//

import SwiftUI

struct SearchView: View {
    @Binding var inputSearch: String
    var body: some View {
        VStack(spacing: 4){
            HStack(spacing: 0){
                Image(IC_SEARCH)
                    .resizable()
                    .frame(width: 17.5, height: 17.5)
                Spacer()
                TextField(inputSearch, text: $inputSearch)
                    .font(.system(size: 16, weight: .light))
                    .foregroundColor(Color(GRAY_B5B5B5))
            }
            
            Divider()
                .frame(height: 1)
                .background(Color(GRAY_BECEDA))
        }
        .frame(width: 150)
    }
}
