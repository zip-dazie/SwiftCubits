//
//  Layer_1.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 3/10/24.
//

import SwiftUI

struct Layer_1: View {
    var body: some View {
        //TODO: spacing, and anchoring to bottom
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Layer 1").navigationBarBackButtonHidden(true)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top)
                        .padding(.leading, 20)
                    NavigationLink(destination: Layer_2()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(Color.customPurple)
                                .frame(width: 100, height: 50)
                                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                            Image(systemName: "arrow.right")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 50)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.leading, 20) 
                }
            }
        }
    }
}


#Preview {
    Layer_1()
}
