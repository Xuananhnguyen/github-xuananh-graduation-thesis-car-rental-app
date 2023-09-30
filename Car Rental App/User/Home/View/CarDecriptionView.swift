//
//  CarDecriptionView.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 14/03/2023.
//

import SwiftUI

struct CarDecriptionView: View {
    var title: String = ""
    var decription: String = ""
    
    var body: some View {
        VStack(spacing: 8){
            Text(title)
                .font(.custom("PT Sans", size: 12))
                .foregroundColor(Color(BLUE_95BCCC))
            Text(decription)
                .font(.custom("PT Sans", size: 12))
                .foregroundColor(Color(BLACK_000000))
        }
        .padding(EdgeInsets(top: 14, leading: 49, bottom: 33, trailing: 49))
        .frame(width: 155, height: 89, alignment: .center)
        .background(Color(WHITE_F6F6F6))
        .cornerRadius(3)
    }
}

struct CarDecriptionView_Previews: PreviewProvider {
    static var previews: some View {
        CarDecriptionView()
    }
}
