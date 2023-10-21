//
//  CarDetailViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 21/10/2023.
//

import Foundation

class CarDetailViewModel: ObservableObject {
    @Published var carDetail: CarModel?
    
    func carDetail(vehicleID: Int) {
        LoadingViewModel.share.onShowProgress(isShow: true)
        CarRentailServices.shared.carDetail(vehicleID: vehicleID) { response in
            if response.code == 1 {
                LoadingViewModel.share.onShowProgress(isShow: false)
                self.carDetail = response.data
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
}
