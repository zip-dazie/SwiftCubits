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
            LazyVStack {
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
                        .fontWeight(.heavy)              .font(.system(size: 23))
                        .padding([.leading], 20)
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 0) {
                        ForEach(0..<6, id: \.self) { index in
                            GeometryReader { geometry in
                                Image("catFiller")
                                    .resizable()
                                    .frame(width: 198, height: 270)
                                    .cornerRadius(10)
                                    .scaleEffect(scaleValue(geometry: geometry), anchor: .center)
                            }
                            .frame(width: 198, height: 290)
                            
                        }
                    }
                }
            }
            
            HStack {
                Text("Personalization")
                    .fontWeight(.heavy)              .font(.system(size: 23))
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
            
        } .padding(.bottom, 55)
    }
}

private func scaleValue(geometry: GeometryProxy) -> CGFloat {
    let midPoint = UIScreen.main.bounds.width / 2
    let viewFrame = geometry.frame(in: .global)
    let distance = abs(midPoint - viewFrame.midX)
    let scale = max(1.0 - distance / 1000, 0.9) // Adjust 500 and 0.9 as needed
    return scale
}
#Preview {
    Profile()
}

