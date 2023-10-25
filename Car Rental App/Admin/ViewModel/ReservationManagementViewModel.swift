//
//  ReservationManagementViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 24/10/2023.
//

import Foundation

class ReservationManagementViewModel: ObservableObject {
    
    @Published var listAllReservation: [AdminReservationModel] = []
    
    func getAllReservation() {
        LoadingViewModel.share.onShowProgress(isShow: true)
        AdminServices.shared.getAllReservation { response in
            LoadingViewModel.share.onShowProgress(isShow: false)
            if response.code == 1 {
                self.listAllReservation = response.data ?? []
            } else {
                let confirmDialog = ConfirmDialog(content: response.message ?? "")
                Popup.presentPopup(alertView: confirmDialog)
            }
        } failBlock: { error in
            LoadingViewModel.share.onShowProgress(isShow: false)
            let confirmDialog = ConfirmDialog(content: error.localizedDescription)
            Popup.presentPopup(alertView: confirmDialog)
        }
    }
    
    func approveReservation(reservationID: Int, statusID: Int, completions: (() -> Void)? = nil) {
        LoadingViewModel.share.onShowProgress(isShow: true)
        AdminServices.shared.approveReservation(reservationID: reservationID,
                                                statusID: statusID) { response in
            LoadingViewModel.share.onShowProgress(isShow: false)
            if response.code == 1 {
                let confirmDialog = ConfirmDialog(content: response.message ?? "", confirmAction: completions)
                Popup.presentPopup(alertView: confirmDialog)
            } else {
                let confirmDialog = ConfirmDialog(content: response.message ?? "")
                Popup.presentPopup(alertView: confirmDialog)
            }
        } failBlock: { error in
            LoadingViewModel.share.onShowProgress(isShow: false)
            let confirmDialog = ConfirmDialog(content: error.localizedDescription)
            Popup.presentPopup(alertView: confirmDialog)
        }
    }
    
    func updateAction(status: ReservationStatus) -> Int {
        switch status {
        case .awaitingDeposit:
            return 2
        case .depositConfirmed:
            return 3
        case .carReceived:
            return 4
        case .paymentComplete:
            return 5
        default:
            return 5
        }
    }
}
