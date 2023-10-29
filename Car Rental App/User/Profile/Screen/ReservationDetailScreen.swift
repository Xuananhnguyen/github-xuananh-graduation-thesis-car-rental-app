//
//  ReservationDetailScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 30/09/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct ReservationDetailScreen: AppNavigator {
    @StateObject var viewModel = ReservationDetailViewModel()
    var reservationID: Int
    
    var body: some View {
        VStack {
            BaseNavigationView {
                headerDetailView
            } builderContent: {
                VStack(spacing: 0){
                    carView
                    Spacer()
                    if viewModel.reservationData?.statusId == 1 {
                        ButtonAuth(title: "Đặt cọc", onPress: {
                            let paymentDialog = PaymentViewDialog(invoiceCode: viewModel.reservationData?.invoiceCode ?? "")
                            Popup.presentPopup(alertView: paymentDialog)
                        })
                            .padding(.bottom, 8)
                        ButtonAuth(title: "Huỷ", onPress: {
                            viewModel.approveReservation(reservationID: reservationID) {
                                navigator.pop()
                            }
                        })
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(WHITE_FFFFFF))
                .padding(.horizontal, 16)
            }
            .onAppear {
                viewModel.getUserCarReservation(reservationID: reservationID) {
                    if viewModel.reservationData?.statusId == 5 {
                        let ratingDialog = RatingViewDialog(reservationID: viewModel.reservationData?.reservationId ?? 0,
                                                             vehicleID: viewModel.reservationData?.vehicleId ?? 0)
                        Popup.presentPopup(alertView: ratingDialog)
                    }
                }
            }
        }
    }
}

extension ReservationDetailScreen {
    // MARK: Make Header
    var headerDetailView: some View {
        HStack(spacing: 16) {
            Image(IC_ARROW_LEFT)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color(BLACK_000000))
                .frame(width: 13, height: 21)
                .onTapGesture {
                    navigator.pop()
                }
            
            Text(viewModel.reservationData?.vehicleName?.uppercased() ?? "")
                .textStyle(.ROBOTO_BOLD, size: 23)
                .foregroundColor(Color(BLACK_000000))
            Spacer()
        }
        .padding(.horizontal, 16)
    }
    
    // MARK: Make Header
    var carView: some View {
        VStack(alignment: .leading, spacing: 0){
            if let img = URL(string: viewModel.reservationData?.vehicleImage ?? "") {
                WebImage(url: img)
                    .resizable()
                    .frame(height: 200)
                    .padding(.bottom, 15)
            }
            
            VStack(alignment: .leading, spacing: 10){
                Divider()
                    .frame(height: 1)
                    .background(Color(GREEN_2B4C59))
                
                Text(viewModel.reservationData?.vehicleName?.uppercased() ?? "")
                    .textStyle(.ROBOTO_MEDIUM, size: 18)
                
                Text(viewModel.reservationData?.vehicleRegistrationNumber ?? "")
                    .textStyle(.ROBOTO_MEDIUM, size: 13)
                    .foregroundColor(Color(GREEN_2B4C59))
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    .frame(height: 22)
                    .background(Color(GRAY_EEEEEE))
                    .cornerRadius(3)
                
                Text("Màu xe: \(viewModel.reservationData?.color ?? "")")
                    .textStyle(.ROBOTO_REGULAR, size: 14)
                    .foregroundColor(Color(BLACK_000000))
                
                Text("Giá cọc: \(Int(Double(viewModel.reservationData?.totalAmount ?? 0) * 0.3)) VND/ngày")
                    .textStyle(.ROBOTO_MEDIUM, size: 14)
                    .foregroundColor(Color(BLACK_000000))
                
                Text("Giá thuê: \(viewModel.reservationData?.totalAmount ?? 0) VND/ngày")
                    .textStyle(.ROBOTO_MEDIUM, size: 14)
                    .foregroundColor(Color(BLACK_000000))
                
                Text("Số ngày thuê: \(viewModel.reservationData?.numberOfRentalDays ?? 0)")
                    .foregroundColor(Color(BLACK_000000))
                    .textStyle(.ROBOTO_MEDIUM, size: 14)
                
                Text(String(format: "from".localized, viewModel.reservationData?.startDay ?? ""))
                    .textStyle(.ROBOTO_MEDIUM, size: 14)
                    .foregroundColor(Color(BLACK_000000))
                
                Text(String(format: "to".localized, viewModel.reservationData?.endDay ?? ""))
                    .textStyle(.ROBOTO_MEDIUM, size: 14)
                    .foregroundColor(Color(BLACK_000000))

                if let statusType = ReservationStatus(rawValue: viewModel.reservationData?.statusId ?? 0) {
                    HStack(spacing: 1) {
                        Text("Trạng thái: ")
                            .textStyle(.ROBOTO_MEDIUM, size: 14)
                            .foregroundColor(Color(BLACK_000000))
                        
                        Text(statusType.description)
                            .foregroundColor(Color(statusType.renderColor))
                            .textStyle(.ROBOTO_MEDIUM, size: 14)
                    }
                }
            }
        }
    }
}
