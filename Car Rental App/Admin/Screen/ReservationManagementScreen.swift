//
//  ReservationManagementScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 24/10/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct ReservationManagementScreen: View {
    @StateObject var viewModel = ReservationManagementViewModel()
    
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false,
                           title: "Quản lý lịch đặt xe") {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.listAllReservation.indices, id: \.self) { index in
                    let item = viewModel.listAllReservation[index]
                    VStack(spacing: 12) {
                        HStack(spacing: 16){
                            VStack(spacing: 0) {
                                if let img = URL(string: item.vehicleImage ?? "") {
                                    WebImage(url: img)
                                        .resizable()
                                        .frame(width: 60, height: 50)
                                        .cornerRadius(5)
                                }
                                Spacer()
                            }
                            .frame(maxHeight: .infinity)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Người thuê: \(item.userName ?? "")" )
                                        .textStyle(.ROBOTO_MEDIUM, size: 14)
                                    
                                    Text(item.vehicleName?.uppercased() ?? "")
                                        .textStyle(.ROBOTO_MEDIUM, size: 14)
                                    
                                    Text(item.vehicleRegistrationNumber ?? "")
                                        .textStyle(.ROBOTO_MEDIUM, size: 13)
                                        .foregroundColor(Color(GREEN_2B4C59))
                                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                                        .frame(height: 22)
                                        .background(Color(GRAY_EEEEEE))
                                        .cornerRadius(3)
                                }
                                
                                VStack(alignment: .leading, spacing: 10){
                                    
                                    Text("Màu xe: \(item.color ?? "")")
                                        .textStyle(.ROBOTO_REGULAR, size: 14)
                                        .foregroundColor(Color(BLACK_000000))
                                    
                                    Text("Giá cọc: \(Int(Double(item.totalAmount ?? 0) * 0.3)) VND/ngày")
                                        .textStyle(.ROBOTO_MEDIUM, size: 14)
                                        .foregroundColor(Color(BLACK_000000))
                                    
                                    Text("Giá thuê: \(item.totalAmount ?? 0) VND/ngày")
                                        .textStyle(.ROBOTO_MEDIUM, size: 14)
                                        .foregroundColor(Color(BLACK_000000))
                                    
                                    Text("Số ngày thuê: \(item.numberOfRentalDays ?? 0)")
                                        .foregroundColor(Color(BLACK_000000))
                                        .textStyle(.ROBOTO_MEDIUM, size: 14)
                                    
                                    Text(String(format: "from".localized, item.startDay ?? ""))
                                        .textStyle(.ROBOTO_MEDIUM, size: 14)
                                        .foregroundColor(Color(BLACK_000000))
                                    
                                    Text(String(format: "to".localized, item.endDay ?? ""))
                                        .textStyle(.ROBOTO_MEDIUM, size: 14)
                                        .foregroundColor(Color(BLACK_000000))
                                    
                                    Text("Mã hoá đơn: \(item.invoiceCode ?? "")")
                                        .textStyle(.ROBOTO_MEDIUM, size: 14)
                                    
                                    Text("Ghi chú: \(item.note ?? "")")
                                        .textStyle(.ROBOTO_MEDIUM, size: 14)

                                    if let statusType = ReservationStatus(rawValue: item.statusId ?? 0) {
                                        HStack(spacing: 1) {
                                            Text("Trạng thái: ")
                                                .textStyle(.ROBOTO_MEDIUM, size: 14)
                                                .foregroundColor(Color(BLACK_000000))
                                            
                                            Text(statusType.description)
                                                .foregroundColor(Color(statusType.renderColor))
                                                .textStyle(.ROBOTO_MEDIUM, size: 14)
                                        }
                                    }
                                    
                                    HStack(spacing: 10){
                                        if let statusAction = ReservationStatus(rawValue: item.statusId ?? 0) {
                                            Button {
                                                viewModel.approveReservation(reservationID: item.reservationId ?? 0,
                                                                             statusID: viewModel.updateAction(status: statusAction)) {
                                                    viewModel.getAllReservation()
                                                }
                                            } label: {
                                                Text(statusAction.description)
                                                    .textStyle(.ROBOTO_MEDIUM, size: 14)
                                                    .foregroundColor(Color(WHITE_FFFFFF))
                                                    .padding(EdgeInsets(top: 5, leading: 14, bottom: 5, trailing: 14))
                                                    .background(Color(GREEN_2B4C59))
                                                    .cornerRadius(5)
                                            }
                                        }
                                        
                                        Button {
                                            viewModel.approveReservation(reservationID: item.reservationId ?? 0,
                                                                         statusID: 0) {
                                                viewModel.getAllReservation()
                                            }
                                        } label: {
                                            Text("Từ chối")
                                                .textStyle(.ROBOTO_MEDIUM, size: 14)
                                                .foregroundColor(Color(WHITE_FFFFFF))
                                                .padding(EdgeInsets(top: 5, leading: 14, bottom: 5, trailing: 14))
                                                .background(Color(RED_C64949))
                                                .cornerRadius(5)
                                        }
                                    }
                                    .disabled(item.statusId == 5 || item.statusId == 0)
                                }
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 14, leading: 10, bottom: 14, trailing: 10))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(WHITE_FFFFFF))
                    .cornerRadius(10)
                    .shadow(radius: 8, y: 8)
                    .padding(.horizontal, 16)
                }
            }
        }
        .onAppear {
            viewModel.getAllReservation()
        }
    }
}
