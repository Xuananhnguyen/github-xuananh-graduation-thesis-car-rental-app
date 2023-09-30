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
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found")
            return
        }
        
        try await AuthenticationManager.shared.signInUser(email: email, password: password)
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
