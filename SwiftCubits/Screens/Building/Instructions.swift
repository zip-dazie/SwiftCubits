//
//  Instructions.swift
//  SwiftCubits
//
//  Created by Wei Chen on 1/3/24.
//

import SwiftUI

struct Instructions: View {
    let placeholders = [
          ModelPlaceholder(label: "6x"),
          ModelPlaceholder(label: "2x"),
          ModelPlaceholder(label: "6x"),
          ModelPlaceholder(label: "4x"),
          ModelPlaceholder(label: "4x"),
          ModelPlaceholder(label: "6x")
      ]
    var body: some View {
        ZStack {
            GeometryReader{ geometry in
                VStack{
                    Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    Spacer()
                    //Model() TODO: RE ADD MODEL RENDER AFTER DETERMINING HOW FILE RETRIEVAL WORKS

                    //DynamicRoundedRectangle(modelPlaceholders: placeholders)

                }
            }
        }.padding(.bottom, 55)
        
    }
}


#Preview {
    Instructions()
}
