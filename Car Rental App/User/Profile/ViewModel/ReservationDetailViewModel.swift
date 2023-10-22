//
//  ReservationDetailViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 30/09/2023.
//

import Foundation

class ReservationDetailViewModel: ObservableObject {
    @Published var reservationData: ReservationDetailModel?
    
    func getUserCarReservation(reservationID: Int) {
        LoadingViewModel.share.onShowProgress(isShow: true)
        CarRentailServices.shared.userReservationDetail(reservationID: reservationID)  { response in
            if response.code == 1 {
                LoadingViewModel.share.onShowProgress(isShow: false)
                self.reservationData = response.data
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
