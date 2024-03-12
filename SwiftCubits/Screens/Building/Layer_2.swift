//
//  Layer_2.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 3/10/24.
//

import SwiftUI

struct Layer_2: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        NavButton(destination: Layer_1(), icon: "leftArrow")
                        Spacer()
                        Text("Layer 2")
                            .font(.system(size: 27, weight: .bold))
                        Spacer()
                        NavButton(destination: Layer_3(), icon: "rightArrow")
                    }
                    .padding(.horizontal)
                    
                    Text("Layer 2 Content")
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
