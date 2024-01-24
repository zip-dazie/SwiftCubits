//
//  Build.swift
//  SwiftCubits
//
//  Created by Wei Chen on 1/5/24.
//

import SwiftUI

import SceneKit
struct Build: View {
    @State var scene: SCNScene? = .init(named: "GOAT.usdz")
    var body: some View {
        VStack{
            Text("Build").offset(y: 100)
            SceneView()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color("Dark")
                   
            } .ignoresSafeArea()
      
    }

}

#Preview {
    Build()
}
