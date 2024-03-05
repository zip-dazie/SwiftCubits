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
    
    @State var primarySCNScene:SCNScene?
    @State var foundURL: Bool = false
    @State var url:URL?
    
    @State var scene:SCNScene? = .init(named: "CTest.scn")
    
    //test
    let fileManager = FileManager.default
    
    init(){
        findValidFile()
        
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
    
    func findValidFile(){
        //
        if let sceneURL = Bundle.main.url(forResource: "CubitTest", withExtension: "scn", subdirectory: "CubitsCatalog.scnassets"){
//            print(sceneURL.absoluteString)
            if(FileManager.default.fileExists(atPath: sceneURL.absoluteString)){
//                print(sceneURL.absoluteString)
            }
            else{
//                print("File not found")
            }
                
        }
        else{
//            print("File not found")
        }
        
    }
    
    
    var body: some View {
        VStack{
            SingleCubitView(scene: $scene)
                .frame(width: 350, height:350)
        }
        Text("This is the subscreen for test")
    }
}

#Preview(){
    SheetView()
}
