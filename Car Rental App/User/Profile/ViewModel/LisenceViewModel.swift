//
//  LisenceViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 23/10/2023.
//

import Foundation

class LisenceViewModel: ObservableObject {
    
    func updateLicense(idCard: String,
                       drivingLicense: String) {
        LoadingViewModel.share.onShowProgress(isShow: true)
        ProfileServices.shared.updateLicense(idCard: idCard,
                                             drivingLicense: drivingLicense) { response in
            if response.code == 1 {
                LoadingViewModel.share.onShowProgress(isShow: false)
                let confirmDialog = ConfirmDialog(content: response.message?.removingPercentEncoding ?? "")
                Popup.presentPopup(alertView: confirmDialog)
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
