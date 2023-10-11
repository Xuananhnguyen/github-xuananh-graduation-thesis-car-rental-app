//
//  ResetPasswordViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 12/10/2023.
//

import Foundation

class ResetPasswordViewModel: ObservableObject {
    @Published var newPassword: String = ""
    @Published var confirmPassword: String = ""
    
    func resetPassword(userID: Int, completions: (() -> Void)? = nil) {
        LoadingViewModel.share.onShowProgress(isShow: true)
        AuthServices.shared.resetPassword(userID: userID, newPassword: newPassword) { response in
            if response.code == 1 {
                LoadingViewModel.share.onShowProgress(isShow: false)
                AppViewModel.shared.showToast {
                    StatusToast(status: response.message?.removingPercentEncoding ?? "")
                }
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
    
    func validatePassword(completion: (() -> Void)? = nil) {
        if !newPassword.validate(regex: REGEX.password) {
            let confirmDialog = ConfirmDialog(content: "passwordInvalid".localized)
            Popup.presentPopup(alertView: confirmDialog)
        } else {
            completion?()
        }
    }
}
