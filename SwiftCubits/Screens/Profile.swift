//
//  Profile.swift
//  SwiftCubits
//
//  Created by Wei Chen on 1/3/24.
//

import SwiftUI

struct Profile: View {
    //@EnvironmentObject private var authManagerCopy: AuthManager
    @Binding var showSignInView: Bool
    @StateObject private var viewModel = SettingsViewModel()
    
    var body: some View {
        ScrollView{
            LazyVStack {
                Image("peterIcon")
                    .resizable()
                    .frame(width: 72, height: 72)
                    .clipShape(Circle())
                
                Text("Peter Johnson")
                    .bold()
                    .font(.system(size:20))
                    .padding()
                
                HStack {
                    Text("My Favorites")
                        .fontWeight(.heavy)              
                        .font(.system(size: 23))
                        .padding([.leading], 20)
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 20) {
                        Image("skullHome")
                            .resizable()
                            .frame(width: 198, height: 270)
                            .cornerRadius(10)
                        
                        Image("asteroidHome")
                            .resizable()
                            .frame(width: 198, height: 270)
                            .cornerRadius(10)
                        
                        Image("personHome")
                            .resizable()
                            .frame(width: 198, height: 270)
                            .cornerRadius(10)
                    }
                }
            }
            
            
            HStack {
                Text("Personalization")
                    .fontWeight(.heavy)              
                    .font(.system(size: 23))
                    .padding([.leading], 20)
                
                Spacer()
            }
            
            Button(action: {
                print("clicked")
            }) {
                
                HStack {
                    
                    Image("settingsicon")
                        .foregroundColor(.purple)
                    
                    Text("Settings")
                        .font(.system(size: 16))
                        .padding([.leading], 5)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Image("arrowrighticon")
                }
                .padding()
                .frame(width: 342, height: 65)
                .background(
                    RoundedRectangle(
                        cornerRadius: 10,
                        style:.continuous
                    )
                    .fill(Color("CustomGray"))
                )
                
            }
            .padding([.top,.bottom], 5)
            
            Button(action: {
                print("clicked")
            }){
                HStack {
                    
                    Image("notificationsicon")
                    
                    Text("Notifications")
                        .font(.system(size: 16))
                        .padding([.leading], 5)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Image("arrowrighticon")
                }
                .padding()
                .frame(width: 342, height: 65)
                .background(
                    RoundedRectangle(
                        cornerRadius: 10,
                        style:.continuous
                    )
                    .fill(Color("CustomGray"))
                )
                
            }
            .padding([.top,.bottom], 5)
            Button(action: {
                Task {
                    do {
                        try viewModel.signOut()
                        showSignInView = true
                    } catch {
                        //TODO: FIX THIS ERROR HANDLING
                        print(error)
                    }
                }
            }) {
                Text("Log out")
                    .frame(width: 342, height: 65)
                    .foregroundColor(Color.black)
                    .bold()
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color("CustomGray"))
                    )
            }
            
            
        } .padding(.bottom, 55)
    }
}

private func scaleValue(geometry: GeometryProxy) -> CGFloat {
    let midPoint = UIScreen.main.bounds.width / 2
    let viewFrame = geometry.frame(in: .global)
    let distance = abs(midPoint - viewFrame.midX)
    let scale = max(1.0 - distance / 1000, 0.9)
    return scale
}
#Preview {
    Profile(showSignInView: .constant(false))
}

