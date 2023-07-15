//
//  ProfileViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 21/11/2022.
//

import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published private(set) var user: DBUser? = nil
    
    func loadCurrentUser() async throws {
        let authDataResult = try AuthenticationManager.shared.getAuthenticateUser()
        self.user = try await UserManager.shared.getUser(userId: authDataResult.email ?? "")
    }
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
}
