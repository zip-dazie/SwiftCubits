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
//    let scene = SCNScene()
    
//    let box: SCNBox = .init()
    @Binding var scene: SCNScene?
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.scene = scene
        sceneView.allowsCameraControl = true
        sceneView.backgroundColor = UIColor.gray
        sceneView.antialiasingMode = .multisampling2X
        
        return sceneView
        //        let scene = SCNScene()
        
//        let box = SCNNode()
//        box.geometry = SCNBox(width: 3, height: 3, length: 3, chamferRadius: 0)
//        box.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        //box.geometry?.firstMaterial?.specular.contents = UIColor.gray
//        scene.rootNode.addChildNode(box)
        
//        SCNTransaction.begin()
//        box.position = SCNVector3(0,0,-10)
//        SCNTransaction.commit()
        
        
//        view.autoenablesDefaultLighting = true
        
        
    }
    
    
    func updateUIView(_ uiView: SCNView, context: Context){
//        uiView.backgroundColor = .black
    }
}

#Preview{
//    let mockScene = SCNScene.init(named:"Test_0-1")
    SingleCubitView(scene: .constant(SCNScene.init(named:"CubitTest.scn")))
}
