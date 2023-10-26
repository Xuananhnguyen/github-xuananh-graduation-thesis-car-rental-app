//
//  RatingViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 26/10/2023.
//

import Foundation

class RatingViewModel: ObservableObject {
    @Published var message: String = ""
    
    func createReview(reservationID: Int,
                      vehicleID: Int,
                      rating: Int,
                      comment: String,
                      completions: (() -> Void)? = nil) {
        LoadingViewModel.share.onShowProgress(isShow: true)
        ProfileServices.shared.createReview(reservationID: reservationID,
                                            vehicleID: vehicleID,
                                            rating: rating,
                                            comment: comment) { response in
            LoadingViewModel.share.onShowProgress(isShow: false)
            if response.code == 1 {
                self.message = response.message?.removingPercentEncoding ?? ""
                completions?()
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
}
