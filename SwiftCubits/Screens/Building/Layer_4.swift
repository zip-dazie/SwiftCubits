//
//  Layer_4.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 3/10/24.
//

import SwiftUI
struct Layer_4: View {
    let placeholders = [
        //TODO: insert 3D model URLS
        ModelPlaceholder(label: "6x", modelURL: nil),
        ModelPlaceholder(label: "6x", modelURL: nil),
        ModelPlaceholder(label: "6x", modelURL: nil),
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        NavButton(destination: Layer_3(), icon: "leftArrow")
                            .frame(width: 30, height: 30)
                        Text("Layer 4")
                            .font(.system(size: 27, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .center)

                        NavButton(destination: Complete(), icon: "rightArrow")
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
                    NavButton(destination: Layer_3(), icon: "leftArrow", linkText: "Back", orientation: .backward)
                    Spacer()
                    NavButton(destination: Complete(), icon: "rightArrow", linkText: "Next")
                }
                .padding(.horizontal)

            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}
#Preview {
    Layer_2()
}
