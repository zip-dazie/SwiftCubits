//
//  AuthView.swift
//  SwiftCubits
//
//  Created by Arthur Chan on 1/25/24.
//

import Foundation
import SwiftUI



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
