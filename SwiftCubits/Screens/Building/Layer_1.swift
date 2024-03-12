//
//  Layer_1.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 3/10/24.
//

import SwiftUI
struct Layer_1: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Color.clear.frame(width: 30, height: 30)
                        Spacer()
                        Text("Layer 1")
                            .font(.system(size: 27, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .center)

                        Spacer()
                        NavButton(destination: Layer_2(), icon: "rightArrow")
                            .frame(width: 30, height: 30, alignment: .trailing)
                    }
                    .padding()
                    Text("Layer 1 Content")
                        .padding()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}



#Preview {
    Layer_1()
}
