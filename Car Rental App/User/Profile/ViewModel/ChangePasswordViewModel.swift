//
//  ChangePasswordViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 26/10/2023.
//

import Foundation

class ChangePasswordViewModel: ObservableObject {
    @Published var oldPassword: String = ""
    @Published var newPassword: String = ""
    @Published var confirmPassword: String = ""
    
    func updatePassword(password: String, newPassword: String, completions: (() -> Void)? = nil) {
        LoadingViewModel.share.onShowProgress(isShow: true)
        ProfileServices.shared.updatePassword(password: password,
                                              newPassword: newPassword) { response in
            LoadingViewModel.share.onShowProgress(isShow: false)
            if response.code == 1 {
                let confirmDialog = ConfirmDialog(content: response.message?.removingPercentEncoding ?? "") {
                    completions?()
                }
                Popup.presentPopup(alertView: confirmDialog)
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
    
    func validatePassword(completion: (() -> Void)? = nil) {
        if !newPassword.validate(regex: REGEX.password) {
            let confirmDialog = ConfirmDialog(content: "passwordInvalid".localized)
            Popup.presentPopup(alertView: confirmDialog)
        } else {
            completion?()
        }
    }
}
