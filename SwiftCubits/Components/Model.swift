//  Model.swift
//  SwiftCubits
//  Created by Wei Chen on 1/19/24.


import SwiftUI
import SceneKit
struct Model: UIViewRepresentable {
    class Coordinator: NSObject {
        var model: Model

        init(model: Model) {
            self.model = model
        }

        @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
            guard let scnView = gesture.view as? SCNView,
                  let targetNode = scnView.scene?.rootNode.childNode(withName: "targetNodeName", recursively: true) else { return }

            let translation = gesture.translation(in: scnView)
            let rotationFactorX: CGFloat = 0.005
            let rotationFactorY: CGFloat = 0.005

            if gesture.state == .changed {
                let newAngleX = Float(translation.y) * Float(rotationFactorX)
                let newAngleY = Float(translation.x) * Float(rotationFactorY)

                targetNode.eulerAngles.y += newAngleY
                targetNode.eulerAngles.x += newAngleX

                gesture.setTranslation(CGPoint.zero, in: scnView)
            }
        }
    }

    func makeUIView(context: Context) -> SCNView {
        let scnView = SCNView()
        scnView.scene = SCNScene()
        scnView.backgroundColor = UIColor.clear

        // Load the 3D model
        guard let modelURL = Bundle.main.url(forResource: "MC1_1", withExtension: "obj"),
              let modelNode = SCNReferenceNode(url: modelURL) else {
            fatalError("Failed to load the model")
        }
        modelNode.load()

        // Add the model to the scene
        scnView.scene?.rootNode.addChildNode(modelNode)

        // Configure camera and lighting
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x:5, y: 0, z: 30)
        scnView.scene?.rootNode.addChildNode(cameraNode)
        
        scnView.autoenablesDefaultLighting = true

        // Ensure targetNode is properly named or identified
        modelNode.name = "targetNodeName"

        // Setup gesture recognizer
        let panGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePan(_:)))
        scnView.addGestureRecognizer(panGesture)

        return scnView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(model: self)
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


#Preview{
    Model()
}

