//
//  SessionManager.swift
//  SwiftCubits
//
//  Created by Arthur Chan on 1/25/24.
//

import Foundation
//import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

//struct AuthDataResultModel{
//    let uid: String
//    let email: String? //optional string
//    let photoUrl: String? //optional string
//}

final class UserManager {
    static let shared = UserManager() //TODO: another singleton here, can fix low priority
    private init() {}
    
    func createNewUser(auth: AuthDataResultModel) async throws{
        var userData: [String:Any] = [
            "user_id" : auth.uid,
            "date_created" : Timestamp(),
            "email" : auth.email
        
        ]
        try await Firestore.firestore().collection("users").document(auth.uid).setData(userData, merge: false)
    }
}
