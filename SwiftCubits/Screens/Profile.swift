//
//  Profile.swift
//  SwiftCubits
//
//  Created by Wei Chen on 1/3/24.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        ScrollView{
            
            LazyVStack{
                
                Image("catFiller")
                    .resizable()
                    .frame(width: 72, height: 72)
                    .clipShape(Circle())
                
                Text("Peter Anteater")
                    .bold()
                    .font(.system(size:20))
                    .padding()
                
                HStack {
                    Text("My Favorites")
                        .bold()
                        .font(.system(size: 20))
                        .padding()
                    
                    Spacer()
                }
                
                ScrollView(.horizontal){
                    LazyHStack {
                        Image("catFiller")
                            .resizable()
                            .frame(width: 198, height: 260)
                            .cornerRadius(10)
                            .padding()
                        
                        Image("catFiller")
                            .resizable()
                            .frame(width: 198, height: 260)
                            .cornerRadius(10)
                            .padding()
                        
                        Image("catFiller")
                            .resizable()
                            .frame(width: 198, height: 260)
                            .cornerRadius(10)
                            .padding()
                        
                        Image("catFiller")
                            .resizable()
                            .frame(width: 198, height: 260)
                            .cornerRadius(10)
                            .padding()
                    }
                }
                
                HStack {
                    Text("Personalization")
                        .bold()
                        .font(.system(size: 20))
                        .padding()
                    
                    Spacer()
                }
                
                Button(action: {
                    print("clicked")
                }) {
                    
                    HStack {
                        
                        Image("settingsicon")
                        
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
                
            }
        }
    }
}

#Preview {
    Profile()
}

