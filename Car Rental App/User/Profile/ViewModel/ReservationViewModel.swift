//
//  ReservationViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 01/08/2023.
//

import Foundation

class ReservationViewModel: ObservableObject {
    @Published var listReservations: [ReservationModel] = []
    
    func getUserCarReservation() {
        LoadingViewModel.share.onShowProgress(isShow: true)
        CarRentailServices.shared.getUserCarReservation() { response in
            if response.code == 1 {
                LoadingViewModel.share.onShowProgress(isShow: false)
                self.listReservations = response.data ?? []
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
