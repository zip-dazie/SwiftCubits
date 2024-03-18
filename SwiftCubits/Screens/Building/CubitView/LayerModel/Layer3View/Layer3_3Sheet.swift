//
//  Layer3_3Sheet.swift
//  SwiftCubits
//
//  Created by Arthur Chan on 3/18/24.
//
import Foundation
import SwiftUI
import SceneKit

struct Layer3_3Sheet: View {
    //TODO: Programmatically pass in the names of the correct cubit piece here
    @State var scene:SCNScene? = .init(named: "Pg3-Layer3.scn")
    
    //view properties
    @State var isVerticalLook: Bool = false
    @GestureState var offset: CGFloat = 0
    //viewproperties stable
    @State private var initialOffset: CGFloat = 0
    @State private var rotationAngleX: Float = 0
    @State private var rotationAngleY: Float = 0
    
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
                    .offset(x: offset )
                    .gesture(
                        DragGesture()
                            .updating($offset, body: { value, out, _ in
                                out = value.location.x-20
                            })
                    )
                    
                }
        }
        .frame(height:20)
        .onChange(of: offset, perform: {newValue in
            rotateObject(animate: offset == .zero)
        })
        .animation(.easeInOut(duration: 0.4))
    }
    
    //Rotation of object
    func rotateObject(animate: Bool = false){
        if (animate){
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.4
        }
        
        let newAngle = Float((offset * .pi) / 180)
        
        if(isVerticalLook){
            scene?.rootNode.childNode(withName: "Layer", recursively: true)?.eulerAngles.x = (newAngle)
        }
        else{
            scene?.rootNode.childNode(withName: "Layer", recursively: true)?.eulerAngles.y = (newAngle)
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
    SheetView(objectName: ("Pg1-Layer1.scn") )
}



