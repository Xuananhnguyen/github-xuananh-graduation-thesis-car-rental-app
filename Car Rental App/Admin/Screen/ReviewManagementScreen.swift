//
//  ReviewManagementScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 24/10/2023.
//

import SwiftUI

struct ReviewManagementScreen: View {
    @StateObject var viewModel = ReviewManagementViewModel()
    
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false,
                           title: "Quản lý đánh giá",
                           backgroundColor: Color(GRAY_EEEEEE)) {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.listReview.indices, id: \.self) { index in
                    let item = viewModel.listReview[index]
                    VStack(alignment: .leading){
                        Text("Đánh giá số: \(item.reservationId ?? 0)")
                            .textStyle(.ROBOTO_REGULAR, size: 14)
                            .foregroundColor(Color(BLACK_000000))
                        
                        Text("Tên xe: \(item.vehicleName ?? "")")
                            .textStyle(.ROBOTO_REGULAR, size: 14)
                            .foregroundColor(Color(BLACK_000000))
                        
                        Text("Rating: \(item.rating ?? 0)")
                            .textStyle(.ROBOTO_REGULAR, size: 14)
                            .foregroundColor(Color(BLACK_000000))
                        
                        Text("Bình luận: \(item.comment ?? "")")
                            .textStyle(.ROBOTO_REGULAR, size: 14)
                            .foregroundColor(Color(BLACK_000000))
                    }
                    .padding(EdgeInsets(top: 14, leading: 10, bottom: 14, trailing: 10))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(WHITE_FFFFFF))
                    .cornerRadius(10)
                    .shadow(radius: 8, y: 8)
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                }
            }
            .onAppear {
                viewModel.getAllReview()
            }
        }
    }
}
