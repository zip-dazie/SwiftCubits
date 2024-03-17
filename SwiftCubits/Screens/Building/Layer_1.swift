//
//  Layer_1.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 3/10/24.
//

import SwiftUI
struct Layer_1: View {
    //TODO: insert Unit URLS
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
                    //TODO: see LayerViewer to remove border, then call with URL
                    LayerView()
                    //TODO: see the UnitViewer file to modify the render view and remove gray color
                    UnitView(modelPlaceholders: placeholders)
                    InstructionsView(modelURLs: modelURLs)
                    
                }
                HStack {
                    Color.clear
                        .frame(width: 40, height: 40)
                    Spacer()
                    NavButton(destination:Layer_2(), icon: "rightArrow", linkText: "Next")
                }.padding(.horizontal)
                
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}



#Preview {
    Layer_1()
}
