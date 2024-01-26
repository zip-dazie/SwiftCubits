//
//  AuthManager.swift
//  SwiftCubits
//
//  Created by Arthur Chan on 1/25/24.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel{ // local copy of authentication
    let uid: String
    let email: String? //optional string
    let photoURL: String? //optional string
    
    init(user: User){ //user sourced from FB sdk
        self.uid = user.uid
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
    }
}

final class AuthManager{
    
    static let shared = AuthManager() // FIX THIS SINGLETON -- DEPENDENCY INJECTION
    private init() { }

    func getAuthUser() throws -> AuthDataResultModel{ //save model locally in SDK, skip database wait
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user: user)
    }
    
    func createUser(email: String, password: String) async throws -> AuthDataResultModel{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    func signOut() throws{
        try Auth.auth().signOut()
    }
}
