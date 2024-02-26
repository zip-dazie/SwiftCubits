//
//  Instructions.swift
//  SwiftCubits
//
//  Created by Wei Chen on 1/3/24.
//

import SwiftUI

struct Instructions: View {
    var body: some View {
        ZStack {
            GeometryReader{ geometry in
                VStack{
                    Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    Spacer()
                    Model()
                    Rectangle()
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .shadow(color:.black, radius: 3, x: 0, y:-1)
                    Text("Instructions")
                }
            }
        }.padding(.bottom, 55)
        
    }
}

#Preview {
    Instructions()
}
