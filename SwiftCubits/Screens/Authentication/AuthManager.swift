//
//  AuthManager.swift
//  SwiftCubits
//
//  Created by Arthur Chan on 1/25/24.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel{ // local copy of authentication configured to store in firebase SDK
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
    
    static let shared = AuthManager() // TODO: fix this singleton, low priority
    private init() { }

    func getAuthUser() throws -> AuthDataResultModel{ //LOCAL COPY IS SAVED -- NO ASYNC
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user: user)
    }
    
    func createUser(email: String, password: String) async throws -> AuthDataResultModel{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    @discardableResult
    func signInUser(email: String, password: String) async throws -> AuthDataResultModel{
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        
        //MARK: MAKE SURE THIS FLOW IS SEPARATE FROM SIGN IN WHEN FIXING FALL THROUGH WITH SIGN IN AND SIGN UP
        //try await UserManager.shared.createNewUser(auth: authDataResult)
        
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    func signOut() throws{
        try Auth.auth().signOut()
    }
}
