//
//  Layer_1.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 3/10/24.
//

import SwiftUI
struct Layer_1: View {
    let placeholders = [
        //TODO: insert 3D model URLS
        ModelPlaceholder(label: "6x", modelURL: nil),
        ModelPlaceholder(label: "2x", modelURL: nil),
        ModelPlaceholder(label: "6x", modelURL: nil),
        ModelPlaceholder(label: "4x", modelURL: nil),
        ModelPlaceholder(label: "4x", modelURL: nil),
        ModelPlaceholder(label: "6x", modelURL: nil)
    ]
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
                    //TODO: insert the 3D model layer here
                    RoundedRectangle(cornerRadius: 12)
                         .stroke(lineWidth: 2)
                         .foregroundColor(.customPurple)
                         .frame(maxWidth: .infinity)
                         .frame(height: 220)
                    //TODO: see the UnitViewer file to modify the render view and remove gray color
                    UnitView(modelPlaceholders: placeholders)

                }
                NavButton(destination:Layer_2(), icon: "rightArrow", linkText: "Next")

            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}
struct shapes: View {
    var body: some View {
        Color.clear
            .frame(width: 60, height: 60)
            .border(Color.gray, width: 1)
            .overlay(Text("6x"))
    }
}

struct InstructionStepView: View {
    let stepNumber: Int
    
    var body: some View {
        HStack {
            Color.clear
                .frame(width: 30, height: 30)
                .border(Color.gray, width: 1)
            Text("\(stepNumber).")
            Spacer()
        }
    }
}

#Preview {
    Layer_1()
}
