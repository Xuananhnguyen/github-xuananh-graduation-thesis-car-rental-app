//
//  RevenueManagementScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 24/10/2023.
//

import SwiftUI

struct RevenueManagementScreen: View {
    @StateObject var viewModel = RevenueManagementViewModel()
    @State var startTime: Date?
    @State var endTime: Date?
    
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false,
                           title: "Quản lý doanh thu") {
            VStack(alignment: .leading, spacing: 16){
                Text("rentalPeriod".localized)
                    .textStyle(.ROBOTO_MEDIUM, size: 18)
                    .foregroundColor(Color(GREEN_2B4C59))
                
                DatePickerTextField(placeholder: "startDay".localized,
                                    date: $startTime,
                                    minimumDate: viewModel.minimumDate())
                    .textStyle(.ROBOTO_REGULAR, size: 16)
                    .padding(.horizontal, 16)
                    .foregroundColor(Color(GREEN_2B4C59))
                    .frame(height: 44)
                    .background(Color(WHITE_F0F0F0))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 2)
                    }
                
                DatePickerTextField(placeholder: "endDay".localized,
                                    date: $endTime,
                                    minimumDate: viewModel.minimumDate(),
                                    onCommit: {
                    if let endDate = endTime, let startDate = startTime {
                        let comparisonResult = startDate.compare(endDate)
                        if comparisonResult == .orderedDescending {
                            let confirmDialog = ConfirmDialog(content: "startDateExceedsEndDate".localized) {
                                self.startTime = Date()
                            }
                            Popup.presentPopup(alertView: confirmDialog)
                        }
                    }
                })
                    .textStyle(.ROBOTO_REGULAR, size: 16)
                    .padding(.horizontal, 16)
                    .foregroundColor(Color(GREEN_2B4C59))
                    .frame(height: 44)
                    .background(Color(WHITE_F0F0F0))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 2)
                    }
                
                ButtonAuth(title: "Xem doanh thu".localized,
                           onPress: {
                    viewModel.getRevenue(startTime: startTime ?? Date(),
                                         endTime: endTime ?? Date())
                })
                
                Text("Tổng số lịch đặt xe: \(viewModel.revenueData?.totalReservations ?? 0)")
                    .textStyle(.ROBOTO_MEDIUM, size: 16)
                    .foregroundColor(Color(BLACK_000000))
                
                Text("Tổng số doanh thu: \(viewModel.revenueData?.totalCost ?? 0)")
                    .textStyle(.ROBOTO_MEDIUM, size: 16)
                    .foregroundColor(Color(BLACK_000000))
            }
            .padding(EdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14))
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(WHITE_FFFFFF))
            
            
            
        }
    }
}
