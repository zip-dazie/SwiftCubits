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
            VStack(alignment: .leading, spacing: 20) {
                Text("Layer 3").navigationBarBackButtonHidden(true)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                    .padding(.leading, 20)
            }
        }
 
            HStack {
                NavigationLink(destination: Layer_2()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color.customPurple)            .frame(width: 100, height: 50)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        Image(systemName: "arrow.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    }
                }
                
                NavigationLink(destination: Layer_4()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color.customPurple)
                            .frame(width: 100, height: 50)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        Image(systemName: "arrow.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)                             .foregroundColor(.white)
                    }
                }
            }
        }
    }
}
#Preview {
    Layer_3()
}
