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
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                
                Text("Peter Anteater")
                    .bold()
                    .font(.largeTitle)
                    .padding()
                
                Text("Creations")
                    .bold()
                    .font(.largeTitle)
                    .padding()
                
                Text("Personalization")
                    .bold()
                    .font(.largeTitle)
                    .padding()
                
                Button(action: {
                    print("clicked")
                }) {
                    Text("Settings")
                        .padding()
                        .frame(maxWidth: 350)
                        .background(
                            RoundedRectangle(
                                cornerRadius: 10,
                                style:.continuous
                            )
                            .fill(Color("CustomGray"))
                        )
                }

            }
        }
    }
}

#Preview {
    Profile()
}

