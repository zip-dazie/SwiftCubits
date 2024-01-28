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
                        //MARK: Sign in fall through occurs here ******************
                        //IF SIGN UP FAILS, WE JUST TRY TO SIGN THEM IN
                        do{
                            try await viewModel.signIn()
                            showSignInView = false
                            return
                        } catch{
                            print ("Error")
                        } //END **********************************
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
