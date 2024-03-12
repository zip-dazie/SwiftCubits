//
//  Layer_3.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 3/10/24.
//

import SwiftUI

struct Layer_3: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        NavButton(destination: Layer_2(), icon: "leftArrow")
                        Spacer()
                        Text("Layer 3")
                            .font(.system(size: 27, weight: .bold))
                        Spacer()
                        NavButton(destination: Layer_4(), icon: "rightArrow")
                    }
                    .padding(.horizontal)
                    
                    Text("Layer 3 Content")
                        .padding()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}
#Preview {
    Layer_3()
}
