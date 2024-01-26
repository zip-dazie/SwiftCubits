//
//  AuthView.swift
//  SwiftCubits
//
//  Created by Arthur Chan on 1/25/24.
//

import Foundation
import SwiftUI

@MainActor // primary thread 
final class SignInEmailViewModel: ObservableObject{
    //published allows dynamic rendering of ui view relative to observable object -- published vars change with view
    @Published var email = ""
    @Published var password = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else{
            print ("Error invalid field") //TODO: Error handling
            return
        }
        
        do {
            let returnedUserData = try await AuthManager.shared.createUser(email: email, password: password)
            print("Success")
            print(returnedUserData)
        } catch{
            //TODO: FIX ERROR HANDLING
            print ("Error: \(error)")
        }
    }
    
    func signIn() async throws{ // MARK: Currently sign up falls through with sign in, fix later
        guard !email.isEmpty, !password.isEmpty else{
            print ("Error invalid field")
            return
        }
        let _ = try await AuthManager.shared.signInUser(email: email, password: password)
    }
}

struct AuthView: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        NavigationStack{
            VStack{
                TextField("Email: ", text: $viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                
                SecureField("Password: ", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                
                Button{
                    Task{
                        do{
                            try await viewModel.signUp()
                            showSignInView = false
                            return
                        }catch{
                            print("Error") //TODO: ERROR HANDLING
                        }
                        //MARK: Sign in fall through occurs here
                        do{
                            try await viewModel.signIn()
                            showSignInView = false
                            return
                        } catch{
                            print ("Error")
                        } //END
                    }
                } label: {
                    Text("Sign up/in")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Sign up/in with Email")
            
        }
            
    }
}


#Preview{
    AuthView(showSignInView: .constant(false));
}
