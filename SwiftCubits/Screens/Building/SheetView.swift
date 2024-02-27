//
//  SheetView.swift
//  SwiftCubits
//
//  Created by Arthur Chan on 2/25/24.
//

import Foundation
import SwiftUI

struct SheetView: View {
    let imageName: String
    @State var primarySCNScene = SingleCubitView()
    
    var body: some View {
        VStack{
            primarySCNScene
                .frame(width: 350, height:350)
        }
        
        Text("This is the subscreen for \(imageName)")
    }
}

#Preview(){
    SheetView(imageName: ("image1"))
}
