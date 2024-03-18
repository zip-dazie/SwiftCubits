//
//  Complete.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 3/10/24.
//

import SwiftUI

struct PostInstructions: View {
    let buildName = "ASTEROID"
    
    var body: some View {
        NavigationStack{
            ZStack {
                // Background layer with images
                VStack {
                    Image("Ornament 72")
                        .position(x: 350, y: 50)
                    Image("Star 7")
                        .position(x: 40, y: 40)
                    Image("Star 6")
                        .position(x: 250, y: 10)
                    Image("Ornament 40")
                        .position(x: 70, y: 10)
                    Image("Ornament 71")
                        .position(x: 370, y: 120)
                    Image("Ornament 50")
                        .position(x: 30, y: 250)
                    Image("Ornament 41")
                        .position(x: 360, y: 250)
                    Image("Ornament 65")
                        .position(x: 20, y: 250)
                    Image("Ornament 64")
                        .position(x: 100, y: 320)
                    Image("Ornament 63")
                        .position(x: 300, y: 320)
                    Spacer()
                }
                
                // Foreground layer with text and buttons
                VStack {
                    Spacer()
                    Text("Congratulations!")
                        .font(.system(size: 24))
                        .fontWeight(.heavy)
                        .navigationBarBackButtonHidden(true)

                    Text("You have completed building ") + Text(buildName).fontWeight(.heavy)
                    Spacer()
                    Image("AsteroidLayer")
//                    LayerView()
                    Spacer()
                    NavigationLink(destination: Home()) {
                        Text("Save to Favorites")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                        
                            .padding()
                            .background(Color.customPurple)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                }
            }.padding(.bottom, 55)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
        
}

#Preview {
    PostInstructions()
}
