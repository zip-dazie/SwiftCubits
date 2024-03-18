//
//  Layer_4.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 3/10/24.
//

import SwiftUI
struct Layer_4: View {
    //TODO: insert 3D model URLS
    let placeholders = [
        ModelPlaceholder(label: "6x", modelURL: nil),
        ModelPlaceholder(label: "6x", modelURL: nil),
        ModelPlaceholder(label: "6x", modelURL: nil),
    ]
    // TODO: completed layer url
    
    
    //TODO: step layers urls:
    let URLStrings = ["Asteroid_2-1", "invalidURL", "Asteroid_5-4", "testURL", "testURL", "testURL"]

    var modelURLs: [URL] {
        URLStrings.compactMap { URL(string: "https://example.com/\($0)") }
    }
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

                        NavButton(destination: PostInstructions(), icon: "rightArrow")
                            .frame(width: 30, height: 30)
                        Spacer()
                    }
                    .padding()
                    //TODO: insert the 3D model layer here
                    LayerView()
                    
                    //TODO: see the UnitViewer file to modify the render view and remove gray color
                    UnitView(modelPlaceholders: placeholders)
                    
                    //TODO: see file to update with models
                    InstructionsView(modelURLs: modelURLs)

                }
                HStack {
                    NavButton(destination: Layer_3(), icon: "leftArrow", linkText: "Back", orientation: .backward)
                    Spacer()
                    NavButton(destination: PostInstructions(), icon: "rightArrow", linkText: "Next")
                }
                .padding(.horizontal)

            }
            .padding(.bottom, 55)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}
#Preview {
    Layer_2()
}
