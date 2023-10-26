//
//  MyProfileViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 16/07/2023.
//

import Foundation

class MyProfileViewModel: ObservableObject {
    
    func updateProfile(name: String,
                       email: String,
                       phoneNumber: String,
                       address: String) {
        LoadingViewModel.share.onShowProgress(isShow: true)
        ProfileServices.shared.updateProfile(name: name,
                                             email: email,
                                             phoneNumber: phoneNumber,
                                             address: address) { response in
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
