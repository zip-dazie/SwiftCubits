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
    @State var foundURL: Bool = false
    @State var url:URL?
    
    //test
    let fileManager = FileManager.default
    
    init(){
        if let sceneURL = Bundle.main.url(forResource: "CubitTest", withExtension: "scn", subdirectory: "CubitsCatalog.scnassets") {
            // Load the scene
            if let loadedScene = try? SCNScene(url: sceneURL, options: nil) {
                // Assign the loaded scene to the @State property
                primarySCNScene = loadedScene
                foundURL = true
                url = sceneURL
            }
            else {
                print("Failed to load scene")
                foundURL = false;
            
                url = nil
            }
        } else {
            print("Scene file not found in bundle")
            foundURL = false;

            url = nil
        }
    }
    
    var body: some View {
        VStack{
            
            if(foundURL == true){
                Text("found")
                Text(url!.absoluteString)
            }
            else if(foundURL == false){
                Text("false")
            }
            SingleCubitView(scene: $primarySCNScene)
                .frame(width: 350, height:350)
        }
        Text("This is the subscreen for test")
    }
}

#Preview(){
    SheetView()
}
