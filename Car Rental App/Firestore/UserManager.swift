//
//  UserManager.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 12/07/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct DBUser {
    let userId: String
    let email: String?
    let dateCreated: Date?
}

final class UserManager {
    static let shared = UserManager()
    private init() {}
    
    func createNewUser(auth: AuthDataResultModel, password: String) async throws {
        var userData: [String : Any] = [
            "user_id" : auth.uid,
            "password": password,
            "date_created" : Timestamp()
        ]
        
        if let email = auth.email {
            userData["email"] = email
        }
        
        if let displayName = auth.displayName {
            userData["display_name"] = displayName
        }
        try await Firestore.firestore().collection("users").document(auth.email ?? auth.uid).setData(userData, merge: false)
    }
    
    func getUser(userId: String) async throws -> DBUser {
        let snapshot = try await Firestore.firestore().collection("users").document(userId).getDocument()
        
        guard let data = snapshot.data(), let userId = data["user_id"] as? String else {
            throw URLError(.badServerResponse)
        }
        
        let email = data["email"] as? String
        let dateCreated = data["date_created"] as? Date
        
        return DBUser(userId: userId, email: email, dateCreated: dateCreated)
    }
}
