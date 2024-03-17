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
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 2)
        //TODO: make clear after adding model
                .foregroundColor(Color.customPurple)
                .frame(width: 330, height: 230)
        }
        .sheet(isPresented: $mainLayer) {
            if let url = url {
                // load model
            } else {
                Text("Update in LayerView.swift")
            }
            
        }
    }
}
#Preview {
    LayerView()
}
