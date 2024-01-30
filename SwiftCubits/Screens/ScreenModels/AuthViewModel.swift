//
//  AuthViewModel.swift
//  SwiftCubits
//
//  Created by Arthur Chan on 1/27/24.
//

import Foundation


@MainActor // primary thread
final class SignInEmailViewModel: ObservableObject{
    //published allows dynamic rendering of ui view relative to observable object -- published vars change with view
    @Published var email = ""
    @Published var password = ""
    
    //TODO: Social media logins calls
    
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else{
            print ("Error invalid field") //TODO: Error handling
            return
        }
        
        do {
            let returnedUserData = try await AuthManager.shared.createUser(email: email, password: password)
            
            //MARK: TEST ME FOR DUPLICATE DATABASE WRITE
            try await UserManager.shared.createNewUser(auth: returnedUserData)
            //
            
            print("Success")
            print(returnedUserData)
        } catch{
            print ("Error: \(error)") //TODO: FIX ERROR HANDLING
        }
    }
    
    func signIn() async throws{ // TODO: Currently sign up falls through with sign in
        guard !email.isEmpty, !password.isEmpty else{
            print ("Error invalid field")
            return
        }
        let _ = try await AuthManager.shared.signInUser(email: email, password: password)
    }
}
