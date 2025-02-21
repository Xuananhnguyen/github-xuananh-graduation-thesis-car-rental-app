//
//  ReservationDetailViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 30/09/2023.
//

import Foundation

class ReservationDetailViewModel: ObservableObject {
    @Published var reservationData: ReservationDetailModel?
    
    func getUserCarReservation(reservationID: Int, completions: (() -> Void)? = nil) {
        LoadingViewModel.share.onShowProgress(isShow: true)
        CarRentailServices.shared.userReservationDetail(reservationID: reservationID)  { response in
            if response.code == 1 {
                LoadingViewModel.share.onShowProgress(isShow: false)
                self.reservationData = response.data
                completions?()
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
    
    func approveReservation(reservationID: Int, completions: (() -> Void)? = nil) {
        LoadingViewModel.share.onShowProgress(isShow: true)
        AdminServices.shared.approveReservation(reservationID: reservationID,
                                                statusID: 0) { response in
            LoadingViewModel.share.onShowProgress(isShow: false)
            if response.code == 1 {
                completions?()
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
