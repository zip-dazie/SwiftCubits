//
//  MainLayerView.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 3/16/24.
//

import SwiftUI

struct LayerView: View {
    @State var mainLayer = false
    var url: URL?
    var body: some View {
        Button(action: {
                    mainLayer = true
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(lineWidth: 2)
                            .foregroundColor(Color.customPurple)
                            .frame(width: 330, height: 230)
                        
                        if let url = url {
                            // TODO: render model, this is a preview not for manipulation
                            //.frame(width: 330, height: 230)
                        } else {
                            Text("Model Preview")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .sheet(isPresented: $mainLayer) {
                    //TODO: manipulation view
                    Text("Model rotation view")
                }
            }
        }

#Preview {
    LayerView()
}
