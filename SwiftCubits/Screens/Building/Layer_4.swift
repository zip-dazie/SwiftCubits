//
//  Layer_4.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 3/10/24.
//

import SwiftUI
struct Layer_4: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        NavButton(destination: Layer_3(), icon: "leftArrow")
                        Spacer()
                        Text("Layer 4")
                            .font(.system(size: 27, weight: .bold))
                        Spacer()
                        NavButton(destination: Complete(), icon: "rightArrow")
                    }
                    .padding(.horizontal)
                    
                    Text("Layer 4 Content")
                        .padding()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}
#Preview {
    Layer_2()
}
