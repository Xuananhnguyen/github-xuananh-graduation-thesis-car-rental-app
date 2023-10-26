//
//  ForgotPasswordViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 06/07/2023.
//

import Foundation

class ForgotPasswordViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var phoneNumber: String = ""
    @Published var userID: Int = 0
    
    func forgotPassword(completions: (() -> Void)? = nil) {
        LoadingViewModel.share.onShowProgress(isShow: true)
        AuthServices.shared.forgotPassword(email: email,
                                           phoneNumber: phoneNumber) { response in
            if response.code == 1 {
                LoadingViewModel.share.onShowProgress(isShow: false)
                self.userID = response.userId ?? 0
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
    
    func validateEmail(completion: (() -> Void)? = nil) {
        if !email.validate(regex: REGEX.email) {
            let confirmDialog = ConfirmDialog(content: "emailOrPasswordInvalid".localized)
            Popup.presentPopup(alertView: confirmDialog)
        } else {
            completion?()
        }
    }
}
