//
//  SignInViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 01/07/2023.
//

import Foundation

final class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signIn(completions: (() -> Void)? = nil) {
        LoadingViewModel.share.onShowProgress(isShow: true)
        AuthServices.shared.signIn(email: email, password: password) { response in
            if response.code == 1 {
                AppDataManager.shared.authenticate = response.data
                LoadingViewModel.share.onShowProgress(isShow: false)
                completions?()
            } else {
                LoadingViewModel.share.onShowProgress(isShow: false)
                let confirmDialog = ConfirmDialog(content: response.message ?? "")
                Popup.presentPopup(alertView: confirmDialog)
            }
        } failBlock: { error in
            LoadingViewModel.share.onShowProgress(isShow: false)
            let confirmDialog = ConfirmDialog(content: error.localizedDescription)
            Popup.presentPopup(alertView: confirmDialog)
        }
    }

    func validate(completion: (() -> Void)? = nil) {
        if !email.validate(regex: REGEX.email) || !password.validate(regex: REGEX.password) {
            let confirmDialog = ConfirmDialog(content: "emailOrPasswordInvalid".localized)
            Popup.presentPopup(alertView: confirmDialog)
        } else {
            completion?()
        }
    }
    
    func disabledButton() -> Bool {
        return email.isEmpty || password.isEmpty
    }
}
