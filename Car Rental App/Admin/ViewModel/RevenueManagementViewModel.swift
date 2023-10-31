//
//  RevenueManagementViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 24/10/2023.
//

import Foundation

class RevenueManagementViewModel: ObservableObject {
    @Published var revenueData: RevenueModel?
    
    func getRevenue(startTime: Date, endTime: Date) {
        LoadingViewModel.share.onShowProgress(isShow: true)
        AdminServices.shared.getRevenue(startTime: formatDateToString(startTime),
                                        endTime: formatDateToString(endTime)) { response in
            LoadingViewModel.share.onShowProgress(isShow: false)
            if response.code == 1 {
                self.revenueData = response.data
            } else {
                let confirmDialog = ConfirmDialog(content: response.message?.removingPercentEncoding ?? "")
                Popup.presentPopup(alertView: confirmDialog)
            }
        } failBlock: { error in
            LoadingViewModel.share.onShowProgress(isShow: false)
            let confirmDialog = ConfirmDialog(content: error.localizedDescription)
            Popup.presentPopup(alertView: confirmDialog)
        }
    }
    
    func formatDateToString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    func minimumDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        // Set a minimum date value
        let minimumDateString = "2023-01-01"
        
        // Convert the minimum date string to a Date object
        if let minimumDate = dateFormatter.date(from: minimumDateString) {
            return minimumDate
        } else {
            // Log an error if the conversion fails
            print("Error: Failed to convert minimum date string to Date object")
            // Return a default minimum date value
            return Date.distantPast
        }
    }
}
