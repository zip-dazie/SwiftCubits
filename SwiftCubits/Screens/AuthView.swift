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
                HStack {
                    
                    
                    Text("Login").navigationBarBackButtonHidden(true)
                        .font(.system(size:25, weight: .heavy))
                        .foregroundColor(Color("customPurple"))
                    
                    Spacer()
                    
                    Image("Shape257")
                        .resizable()
                        .frame(width: 66, height: 75)
                        .padding()
                }
                .padding([.vertical])
                
                VStack (spacing: 24){
                    
                    TextField("Email", text: $viewModel.email)
                        .padding()
                        .foregroundColor(Color("customGrayText"))
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                    
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .foregroundColor(Color("customGrayText"))
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                }
                HStack{
                    Spacer()
                    Button(action: {
                        print("forgot clicked")
                    }){
                        Spacer()
                        Text("Forgot Password?")
                            .font(.system(size: 14))
                            .foregroundColor(Color("customGrayText"))
                            .opacity(0.8)
                            .padding(5)
                        
                        
                    }
                }
                .padding(.bottom, 50)
                
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
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color("customPurple"))
                        .cornerRadius(10)
                }
                
                Text("-or-")
                    .font(.system(size: 14))
                    .opacity(0.6)
                    .padding()
                
                HStack{
                    Text("Don't have an Account?")
                        .font(.system(size: 14))
                        .opacity(0.6)
                    NavigationLink(destination: SignIn(showSignInView: .constant(false))){
                        Text("Sign Up")
                            .font(.system(size: 14))
                            .bold()
                            .foregroundColor(Color("customPurple"))
                    }
                }
            }
            .padding()
            Spacer()
        }
        
    }
}


#Preview{
    AuthView(showSignInView: .constant(false));
}
