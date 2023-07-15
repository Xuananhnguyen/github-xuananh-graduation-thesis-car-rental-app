//
//  SignUpViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 01/07/2023.
//

import Foundation

final class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found")
            return
        }
        
        let authDataResult = try await AuthenticationManager.shared.createUser(email: email, password: password)
        try await UserManager.shared.createNewUser(auth: authDataResult, password: password)
    }
}
