//
//  RatingView.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 26/10/2023.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int?
    
    private func starType(index: Int) -> String {
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: self.starType(index: index))
                        .foregroundColor(Color.orange)
                        .onTapGesture {
                            self.rating = index
                        }
                }
            }
        }
    }
}


struct RatingViewDialog: View {
    @StateObject var viewModel = RatingViewModel()
    @State var rating: Int?
    @State var comment: String = ""
    var reservationID: Int
    var vehicleID: Int
    
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
            .padding(.bottom, 20)
            
            RatingView(rating: $rating)
            Text(rating != nil ? "You rating: \(rating ?? 0)" : "")
                .multilineTextAlignment(.center)
                .textStyle(.ROBOTO_REGULAR, size: 16)
                .foregroundColor(Color(GRAY_A1A1A1))
            
            Text("Bình luận")
                .multilineTextAlignment(.center)
                .textStyle(.ROBOTO_REGULAR, size: 16)
                .foregroundColor(Color(GRAY_A1A1A1))
            
            TextFieldView(inputContent: $comment)
                .padding(.bottom, 20)
            Spacer()
            
            ButtonAuth(title: "Đánh giá dịch vụ", onPress: {
                viewModel.createReview(reservationID: reservationID,
                                       vehicleID: vehicleID,
                                       rating: rating ?? 0,
                                       comment: comment) {
                    Popup.dismiss {
                        AppViewModel.shared.showToast {
                            StatusToast(status: viewModel.message)
                        }
                    }
                }
            })
            .padding(.horizontal, 16)
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        .frame(width: 300, height: 350, alignment: .center)
        .background(Color(WHITE_FFFFFF))
        .cornerRadius(10)
        .onTapGesture {
            self.dimissKeyBoard()
        }
    }
}
