//
//  SheetView.swift
//  SwiftCubits
//
//  Created by Arthur Chan on 2/25/24.
//

import Foundation
import SwiftUI
import SceneKit

struct SheetView: View {
    //TODO: Programmatically pass in the names of the correct cubit piece here
    //var cubitName: String;
//    let imageName: String
    
    @State var primarySCNScene:SCNScene?
//    let sceneURL:URL
//   primarySCNScene = (url: "Test_0-1.scn")
    
    init(){
        let sceneURL = Bundle.main.url(forResource: "Test_0-1", withExtension: "scn", subdirectory: "Cubits")
        
        if (sceneURL == nil){
            //TODO: Error handling
            print("Scene file not found")
        }
        
        do{
            try primarySCNScene = SCNScene(url: sceneURL!)
        }
        catch{
            //TODO: error handling
            print("Not found")
        }
        
    }
    
    var body: some View {
        VStack{
            Text("x")
            SingleCubitView(scene: $primarySCNScene)
                .frame(width: 350, height:350)
        }
        Text("This is the subscreen for test")
    }
}

#Preview(){
    SheetView()
}
