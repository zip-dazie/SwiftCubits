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
        Text("Congratulations!")
            .font(.system(size: 24))
            .fontWeight(.heavy)
        Text("You have completed building ") + Text(buildName).fontWeight(.heavy)
        
        LayerView()
        NavigationLink(destination: Home()) {
            VStack {
                Text("Save to Favorites")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
            }
            .padding()
            .background(Color.customPurple)
            .cornerRadius(10)
        }

    }
}

#Preview {
    PostInstructions()
}
