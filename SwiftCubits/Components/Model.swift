//
//  3DLoad.swift
//  SwiftCubits
//
//  Created by Wei Chen on 1/19/24.


import SwiftUI
import SceneKit

// Code from CHATGPT
struct SceneView: UIViewRepresentable {
    func makeUIView(context: Context) -> SCNView {
        let scnView = SCNView()
        scnView.scene = SCNScene()
        
        // make backgroundt transparent
        scnView.backgroundColor = UIColor.clear

        // Load the USDZ model
        guard let modelURL = Bundle.main.url(forResource: "GOAT", withExtension: "usdz"),
              let modelNode = SCNReferenceNode(url: modelURL) else {
            fatalError("Failed to load the model")
        }
        modelNode.load()
        
        // Add the model to the scene
        scnView.scene?.rootNode.addChildNode(modelNode)

        // Configure camera and lighting
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z:50)
        scnView.scene?.rootNode.addChildNode(cameraNode)
        
        scnView.autoenablesDefaultLighting = true

        // added x axis rotation
        let panGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePan(_:)))
        scnView.addGestureRecognizer(panGesture)
        
        return scnView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {}
    func makeCoordinator() -> Coordinator{
        Coordinator()
    }
}
class Coordinator: NSObject {
     var previousPanLocation: CGPoint? = nil

     @objc func handlePan(_ gestureRecognize: UIPanGestureRecognizer) {
         // Get the SCNView
         let scnView = gestureRecognize.view as! SCNView
         
         let location = gestureRecognize.location(in: scnView)

         if let previousLocation = previousPanLocation {
             // Calculate angle difference
             let deltaX = Float(location.x - previousLocation.x)
             let deltaY = Float(location.y - previousLocation.y)

             // Rotate the model
             if let modelNode = scnView.scene?.rootNode.childNodes.first {
                 modelNode.eulerAngles.x += deltaY * 0.01
                 modelNode.eulerAngles.y += deltaX * 0.01
             }
         }

         // Update previous location
         previousPanLocation = location

         if gestureRecognize.state == .ended {
             previousPanLocation = nil
         }

         // Reset translation
         gestureRecognize.setTranslation(.zero, in: scnView)
     }
 }

