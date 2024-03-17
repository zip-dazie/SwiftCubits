//
//  Layer_3.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 3/10/24.
//

import SwiftUI

struct Layer_3: View {
    let placeholders = [
        //TODO: insert 3D model URLS
        ModelPlaceholder(label: "6x", modelURL: nil),
        ModelPlaceholder(label: "2x", modelURL: nil),
        ModelPlaceholder(label: "6x", modelURL: nil),
        ModelPlaceholder(label: "4x", modelURL: nil),
        ModelPlaceholder(label: "4x", modelURL: nil),
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        NavButton(destination: Layer_2(), icon: "leftArrow")
                            .frame(width: 30, height: 30)
                        Text("Layer 3")
                            .font(.system(size: 27, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .center)

                        NavButton(destination: Layer_4(), icon: "rightArrow")
                            .frame(width: 30, height: 30)
                        Spacer()
                    }
                    .padding()
                    //TODO: insert the 3D model layer here
                    LayerView()
                    
                    //TODO: see the UnitViewer file to modify the render view and remove gray color
                    UnitView(modelPlaceholders: placeholders)

                }
                HStack {
                    NavButton(destination: Layer_2(), icon: "leftArrow", linkText: "Back", orientation: .backward)
                    Spacer()
                    NavButton(destination: Layer_4(), icon: "rightArrow", linkText: "Next")
                }
                .padding(.horizontal)

            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}



#Preview {
    Layer_3()
}
