//
//  ReservationScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 31/07/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct ReservationScreen: AppNavigator {
    @ObservedObject var viewModel = ReservationViewModel()
    
    var body: some View {
        BaseNavigationView {
            headerCarRentalView
        } builderContent: {
            makeListCarRental
        }
        .onAppear {
            viewModel.getUserCarReservation()
        }
    }
}

extension ReservationScreen {
    // MARK: Make Header
    var headerCarRentalView: some View {
        HStack(spacing: 16) {
            Image(IC_ARROW_LEFT)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color(BLACK_000000))
                .frame(width: 13, height: 21)
                .onTapGesture {
                    navigator.pop()
                }
            Text("carRentalNoti".localized)
                .textStyle(.ROBOTO_BOLD, size: 23)
                .foregroundColor(Color(BLACK_000000))
            Spacer()
        }
        .padding(.horizontal, 16)
    }
    
    // MARK: Make body
    var makeListCarRental: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 12){
                ForEach(viewModel.listReservations, id: \.self) { item in
                    itemCarRentalView(status: item.statusId ?? 0,
                                      imageCar: item.vehicleImage ?? "",
                                      nameCar: item.vehicleName ?? "",
                                      totalAmount: item.totalAmount ?? 0,
                                      numberOfRentalDays: item.numberOfRentalDays ?? 0,
                                      startDay: item.startDay ?? "",
                                      endDay: item.endDay ?? "",
                                      reservationID: item.reservationId ?? 0)
                }
            }
            .padding(.top, 8)
        }
    }
    
    // MARK: Item CarRental view
    func itemCarRentalView(status: Int,
                           imageCar: String,
                           nameCar: String,
                           totalAmount: Int,
                           numberOfRentalDays: Int,
                           startDay: String,
                           endDay: String,
                           reservationID: Int) -> some View {
        var textColor: Color = Color(BLACK_000000)
        var statusName: String = ""
        if let statusType = ReservationStatus(rawValue: status) {
            textColor = Color(statusType.renderColor)
            statusName = statusType.description
        }
        return HStack(spacing: 16) {
            VStack(spacing: 0) {
                if let img = URL(string: imageCar) {
                    WebImage(url: img)
                        .resizable()
                        .frame(width: 60, height: 50)
                        .cornerRadius(5)
                }
                Spacer()
            }
            .frame(maxHeight: .infinity)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(nameCar)
                    .textStyle(.ROBOTO_MEDIUM, size: 18)
                    .foregroundColor(Color(GREEN_2B4C59))
                
                HStack(spacing: 1) {
                    Text("Giá thuê: ")
                        .foregroundColor(Color(BLACK_000000))
                    Text("\(totalAmount) VND/Ngày")
                        .foregroundColor(Color(RED_C64949))
                }
                .textStyle(.ROBOTO_BOLD, size: 14)
                
                Text("Số ngày thuê: \(numberOfRentalDays)")
                    .foregroundColor(Color(BLACK_000000))
                    .textStyle(.ROBOTO_MEDIUM, size: 14)
                
                Text(String(format: "from".localized, startDay ))
                    .textStyle(.ROBOTO_MEDIUM, size: 14)
                    .foregroundColor(Color(BLACK_000000))
                
                Text(String(format: "to".localized, endDay))
                    .textStyle(.ROBOTO_MEDIUM, size: 14)
                    .foregroundColor(Color(BLACK_000000))
                
                HStack(spacing: 1) {
                    Text("Trạng thái: ")
                        .textStyle(.ROBOTO_MEDIUM, size: 14)
                        .foregroundColor(Color(BLACK_000000))
                    
                    Text(statusName)
                        .foregroundColor(textColor)
                        .textStyle(.ROBOTO_MEDIUM, size: 14)
                    
                }
            }
        }
        .padding(EdgeInsets(top: 14, leading: 10, bottom: 14, trailing: 10))
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(WHITE_FFFFFF))
        .cornerRadius(10)
        .shadow(radius: 8, y: 8)
        .padding(.horizontal, 16)
        .onTapGesture {
            navigator.pushToView(view: ReservationDetailScreen(reservationID: reservationID))
        }
    }
}
