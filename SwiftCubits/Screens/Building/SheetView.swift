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
    
    @State var objectName:String!
    @State var primarySCNScene:SCNScene?
    @State var foundURL: Bool = false
    @State var url:URL?
    @State var scene:SCNScene? = .init(named: "Cubit_2-2.scn")
    
    
    let fileManager = FileManager.default
    
    //view properties
    @State var isVerticalLook: Bool = false
    @GestureState var offset: CGFloat = 0
    init(objectName:String){
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
//                TODO: ERROR HANDLING
//                    print(sceneURL.absoluteString)
            }
            else{
//                print("File not found")
            }
        }
        else{
//            print("File not found")
        }
        
    }
    
    @ViewBuilder
    func headerView() -> some View {
        HStack{
            Button{
                
            } label: {
                Image(systemName: "arrow.left")
                    .font(.system(size: 16, weight: .heavy))
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)
                    .background{
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(.black.opacity(0.5))
                    }
                    .padding()
                
                Spacer()
                
                Button {
                    withAnimation(.easeInOut){isVerticalLook.toggle()}
                } label: {
                    Image(systemName: "arrow.left.and.right.righttriangle.left.righttriangle.right.fill")
                        .font(.system(size: 16, weight: .heavy))
                        .foregroundColor(.white)
                        .rotationEffect(.init(degrees: isVerticalLook ? 0 : 90))
                        .frame(width:42, height: 42)
                        .background{
                            RoundedRectangle(cornerRadius:15, style: .continuous)
                                .fill(.black.opacity(0.5))
                            
                        }
                        .padding()
                }
                
            }
        }
//        .padding(.top, 60)
    }
    
    @ViewBuilder
    func CustomSeeker() -> some View{
        GeometryReader{_ in
            Rectangle()
                .trim(from: 0, to: 0.474)
                .stroke(.linearGradient(colors: [
                    .clear,
                    .clear,
                    .black.opacity(0.2),
                    .black.opacity(0.6),
                    .black,
                    .black.opacity(0.6),
                    .black.opacity(0.2),
                    .clear,
                    .clear
                ], startPoint: .leading, endPoint: .trailing),
                        style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, miterLimit: 1, dash: [3], dashPhase: 1))
                .overlay {
                    HStack(spacing: 3){
                        Image(systemName: "arrowtriangle.left.fill")
                            .font(.caption)
                        
                        Image(systemName:"arrowtriangle.right.fill")
                            .font(.caption)
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal,7)
                    .padding(.vertical,10)
                    .background {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.white)
                    }
                    .offset(y: -12)
                    .offset(x: offset)
                    .gesture(
                        DragGesture()
                            .updating($offset, body: { value, out, _ in
                                out = value.location.x - 20
                            })
                    )
                    
                }
        }
        .frame(height:20)
        .onChange(of: offset, perform: {newValue in
            rotateObject(animate: offset == .zero)
        })
        .animation(.easeInOut(duration: 0.4), value: offset == .zero)
    }
    
    //Rotation of object
    func rotateObject(animate: Bool = false){
        if (animate){
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.4
        }
        
        let newAngle = Float((offset * .pi) / 180)
        
        if(isVerticalLook){
            scene?.rootNode.childNode(withName: "Root", recursively: true)?.eulerAngles.x = (newAngle)
        }
        else{
            scene?.rootNode.childNode(withName: "Root", recursively: true)?.eulerAngles.y = (newAngle)
        }
        
        if (animate){
            SCNTransaction.commit()
        }
    }
    
    var body: some View {
        VStack{
            headerView()
                .padding(.top, 50)
    
            SingleCubitView(scene: $scene)
                .frame(width: 350, height:300)
            CustomSeeker()
                .padding(.bottom, 30)
                .zIndex(-10)
            
            
        }
        .padding()
        
    }
}

#Preview(){
    SheetView(objectName: ("Cubit_2-2.scn") )
}
