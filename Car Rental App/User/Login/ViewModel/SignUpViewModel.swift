//
//  SignUpViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 01/07/2023.
//

import Foundation

final class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var fullName: String = ""
    @Published var phoneNumber: String = ""
    @Published var address: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    func signUp(completion: (() -> Void)?) {
        LoadingViewModel.share.onShowProgress(isShow: true)
        AuthServices.shared.signUp(fullName: fullName,
                                   email: email,
                                   password: password,
                                   phoneNumber: phoneNumber,
                                   address: address) { response in
            if response.code == 1 {
                LoadingViewModel.share.onShowProgress(isShow: false)
                AppViewModel.shared.showToast {
                    StatusToast(status: response.message?.removingPercentEncoding ?? "")
                }
                completion?()
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
    
    
    
    func disabledButton() -> Bool {
        return email.isEmpty || password.isEmpty || fullName.isEmpty || phoneNumber.isEmpty || confirmPassword.isEmpty
    }
    
    func validate(completion: (() -> Void)? = nil) {
        if !email.validate(regex: REGEX.email) || !password.validate(regex: REGEX.password) {
            let confirmDialog = ConfirmDialog(content: "emailOrPasswordInvalid".localized)
            Popup.presentPopup(alertView: confirmDialog)
        } else {
            completion?()
        }
    }
}
