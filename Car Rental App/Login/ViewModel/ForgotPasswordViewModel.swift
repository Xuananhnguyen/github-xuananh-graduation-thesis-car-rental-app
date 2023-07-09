//
//  ForgotPasswordViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 06/07/2023.
//

import Foundation

class ForgotPasswordViewModel: ObservableObject {
    @Published var email: String = ""
    
    func resetPassword() async throws {
//        let authUser = try AuthenticationManager.shared.getAuthenticateUser()
        
//        if self.email == authUser.email {
        try await AuthenticationManager.shared.resetPassword(email: email)
//        } else {
//            throw URLError(.fileDoesNotExist)
//        }
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
