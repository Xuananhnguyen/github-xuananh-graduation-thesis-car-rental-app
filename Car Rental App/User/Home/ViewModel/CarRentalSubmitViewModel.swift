//
//  CarRentalSubmitViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 21/10/2023.
//

import Foundation

class CarRentalSubmitViewModel: ObservableObject {
    func submitCarRental(vehicleID: Int,
                         startDay: String,
                         endDay: String,
                         numberOfRentalDays: Int,
                         totalAmount: Int,
                         note: String,
                         invoiceCode: Int,
                         completion: (() -> Void)? = nil) {
        LoadingViewModel.share.onShowProgress(isShow: true)
        CarRentailServices.shared.submitCarRental(vehicleID: vehicleID,
                                                  startDay: startDay,
                                                  endDay: endDay,
                                                  numberOfRentalDays: numberOfRentalDays,
                                                  totalAmount: totalAmount,
                                                  note: note,
                                                  invoiceCode: invoiceCode) { response in
            if response.code == 1 {
                LoadingViewModel.share.onShowProgress(isShow: false)
                completion?()
            } else {
                LoadingViewModel.share.onShowProgress(isShow: false)
                let confirmDialog = ConfirmDialog(content: response.message?.removingPercentEncoding ?? "")
                Popup.presentPopup(alertView: confirmDialog)
            }
        } failBlock: { error in
            LoadingViewModel.share.onShowProgress(isShow: false)
            let confirmDialog = ConfirmDialog(content: error.localizedDescription)
            Popup.presentPopup(alertView: confirmDialog)
        }
    }
    
    func generateRandomNumber() -> String {
        var randomDigits = Set<Int>()
    
        let startTime = DispatchTime.now()
    
        while randomDigits.count < 6 {
            let randomNumber = Int(arc4random_uniform(10))
            randomDigits.insert(randomNumber)
        }
    
        // time number return
        let endTime = DispatchTime.now()
        let nanoTime = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let timeInterval = Double(nanoTime) / 1_000_000_000

        let randomString = randomDigits.map { String($0) }.joined()

        print("Chuỗi số ngẫu nhiên gồm 6 chữ số: \(randomString)")
        print("Thời gian sinh số ngẫu nhiên: \(timeInterval) giây")

        return randomString
    }
}
