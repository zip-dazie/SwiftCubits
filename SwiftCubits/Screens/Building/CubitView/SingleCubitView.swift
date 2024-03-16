//
//  PrimaryLayerView.swift
//  SwiftCubits
//
//  Created by Arthur Chan on 2/5/24.
//

import Foundation
import SwiftUI
import SceneKit

struct SingleCubitView: UIViewRepresentable {
    @Binding var scene: SCNScene?
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
        
        
        //MARK: temporary true
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.scene = scene
        sceneView.backgroundColor = .clear
        sceneView.antialiasingMode = .multisampling2X
        
        
        // Unwrap the optional scene
        if let scene = sceneView.scene {
            // Create a camera node
            let cameraNode = SCNNode()
            cameraNode.camera = SCNCamera()
            scene.rootNode.addChildNode(cameraNode)
            sceneView.pointOfView = cameraNode
            // Set the initial position of the camera
            cameraNode.position = SCNVector3(x: 0, y: 5, z: 30)
            
        }
        return sceneView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context){
        //MARK: temporary gray (should be white)
        uiView.backgroundColor = .white
    }
}

#Preview{
    SingleCubitView(scene: .constant(SCNScene.init(named:"Pg1-Layer1.scn")))
}
