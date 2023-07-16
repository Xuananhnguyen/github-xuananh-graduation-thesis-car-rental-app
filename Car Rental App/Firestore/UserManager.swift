//
//  UserManager.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 12/07/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct DBUser: Hashable {
    let email: String?
    let fullName: String?
    let phoneNumber: String?
    let address: String?
    let dateCreated: Date?
}

final class UserManager {
    static let shared = UserManager()
    private init() {}
    
    func createNewUser(auth: AuthDataResultModel, fullName: String, password: String, phoneNumber: String, address: String) async throws {
        var userData: [String : Any] = [
            "user_id" : auth.uid,
            "full_name": fullName,
            "password": password,
            "phone_number": phoneNumber,
            "address": address,
            "date_created" : Timestamp()
        ]
        
        if let email = auth.email {
            userData["email"] = email
        }
        try await Firestore.firestore().collection("users").document(auth.email ?? auth.uid).setData(userData, merge: false)
    }
    
    
    func getUser(email: String) async throws -> DBUser {
        let snapshot = try await Firestore.firestore().collection("users").document(email).getDocument()
        
        guard let data = snapshot.data(), let email = data["email"] as? String else {
            throw URLError(.badServerResponse)
        }
        
        let fullName = data["full_name"] as? String
        let phoneNumber = data["phone_number"] as? String
        let address = data["address"] as? String
        let dateCreated = data["date_created"] as? Date
        
        return DBUser(email: email,
                      fullName: fullName,
                      phoneNumber: phoneNumber,
                      address: address,
                      dateCreated: dateCreated)
    }
    
    func updateUser(email: String) async throws -> DBUser {
        let snapshot = try await Firestore.firestore().collection("users").document(email).updateData(<#T##fields: [AnyHashable : Any]##[AnyHashable : Any]#>)
    }
}
