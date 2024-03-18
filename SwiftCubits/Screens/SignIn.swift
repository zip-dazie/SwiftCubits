import Foundation
import SwiftUI

struct SignIn: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack {
                    VStack(alignment: .leading) {
                        Text("Welcome to").navigationBarBackButtonHidden(true)
                            .font(.system(size:25))
                            .padding(.bottom, 5)
                        
                        Text("Marching Cubes!")
                            .font(.system(size:25, weight: .heavy))
                            .foregroundColor(Color("customPurple"))
                    }
                    Spacer()
                    
                    Image("Shape257")
                        .resizable()
                        .frame(width: 66, height: 75)
                        .padding()
                }
                .padding([.vertical])
                
                VStack (spacing: 24){
                    
                    TextField("Name", text: $viewModel.email)
                        .padding()
                        .foregroundColor(Color("customGrayText"))
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                    
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
                    
                    SecureField("Confirm Password", text: $viewModel.password)
                        .padding()
                        .foregroundColor(Color("customGrayText"))
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                }
                HStack{
                    Text("Have an Account?")
                        .font(.system(size: 14))
                        .opacity(0.6)
                    NavigationLink(destination: AuthView(showSignInView:.constant(true))){
                        Text("Login")
                            .font(.system(size: 14))
                            .bold()
                            .foregroundColor(Color("customPurple"))
                    }
                
                        Spacer()
                        
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
                    Text("Sign up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color("customPurple"))
                        .cornerRadius(10)
                }
            Spacer()
            }
            .padding()
            Spacer()
        }
        
    }


#Preview{
    SignIn(showSignInView: .constant(false));
}
