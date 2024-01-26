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
    
    func signIn(){
        guard !email.isEmpty, !password.isEmpty else{
            print ("Error invalid field") //FIX THIS DISPLAY AN ERROR
            return
        }
        
        Task{
            do {
                let returnedUserData = try await AuthManager.shared.createUser(email: email, password: password)
                print("Success")
                print(returnedUserData)
            } catch{
                //TODO: FIX ERROR HANDLING
                print ("Error: \(error)")
            }
        }
    }
}

struct AuthView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    
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
                    viewModel.signIn()
                } label: {
                    Text("Sign up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Sign up with Email")
            
        }
            
    }
}


#Preview{
    AuthView();
}
