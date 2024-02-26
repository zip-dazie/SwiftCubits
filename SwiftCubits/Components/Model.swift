//  Model.swift
//  SwiftCubits
//  Created by Wei Chen on 1/19/24.


import SwiftUI
import SceneKit
struct Model: UIViewRepresentable {
    var modelURL: URL?
    let placeholderImageName: String = "MC1_1" // Ensure this image is in your asset catalog
    
    func makeUIView(context: Context) -> SCNView {
        let scnView = SCNView()
        scnView.scene = SCNScene()
        scnView.backgroundColor = UIColor.clear

        // Configure camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 0)
        scnView.scene?.rootNode.addChildNode(cameraNode)
        
        scnView.autoenablesDefaultLighting = true

        // Attempt to load the 3D model from the provided URL if available
        if let url = modelURL, let modelNode = SCNReferenceNode(url: url) {
            modelNode.load()
            scnView.scene?.rootNode.addChildNode(modelNode)
            // Adjust camera to fit the object
            adjustCameraPosition(cameraNode: cameraNode, for: modelNode, in: scnView)
        } else {
            // Display a placeholder image if model loading fails or URL is nil
            let plane = SCNPlane(width: 5, height: 5)
            plane.firstMaterial?.diffuse.contents = UIImage(named: placeholderImageName)
            let placeholderNode = SCNNode(geometry: plane)
            scnView.scene?.rootNode.addChildNode(placeholderNode)
        }

        // Setup gesture recognizer
        let panGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePan(_:)))
        scnView.addGestureRecognizer(panGesture)

        return scnView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    private func adjustCameraPosition(cameraNode: SCNNode, for modelNode: SCNNode, in scnView: SCNView) {
        // Compute the bounding box of the model
        let (min, max) = modelNode.boundingBox

        // Calculate the center of the bounding box
        let centerX = (max.x + min.x) / 2
        let centerY = (max.y + min.y) / 2
        let centerZ = (max.z + min.z) / 2

        // Determine the distance to position the camera based on the model's size
        // This is a simple heuristic and might need adjustments for optimal viewing
        let maxDimension = Swift.max(Swift.max(max.x - min.x, max.y - min.y), max.z - min.z)
        let distance = Float(maxDimension) * 2 // Adjust the multiplier as needed

        // Update the camera's position to be centered on the model and away based on the calculated distance
        cameraNode.position = SCNVector3(centerX, centerY, centerZ + distance)

        // Look at the center of the model
        let lookAtConstraint = SCNLookAtConstraint(target: modelNode)
        cameraNode.constraints = [lookAtConstraint]
    }

    class Coordinator: NSObject {
        var modelNode: SCNNode? // Keep a reference to the model node

              @objc func handlePan(_ gestureRecognize: UIPanGestureRecognizer) {
                  guard let scnView = gestureRecognize.view as? SCNView, let modelNode = self.modelNode else { return }

                  let translation = gestureRecognize.translation(in: scnView)
                  let rotationFactor: CGFloat = 0.005

                  if gestureRecognize.state == .changed {
                      let newAngleX = Float(translation.y) * Float(rotationFactor)
                      let newAngleY = Float(translation.x) * Float(rotationFactor)

                      // Apply limited rotation to the modelNode
                      modelNode.eulerAngles.y += newAngleY
                      modelNode.eulerAngles.x += newAngleX

                      gestureRecognize.setTranslation(CGPoint.zero, in: scnView)
                }
            }
        }
    }



#Preview{
    Model(modelURL: Bundle.main.url(forResource: "GOAT", withExtension: "obj")) // Adjust this based on your actual file

}

