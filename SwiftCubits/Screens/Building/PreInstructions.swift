//
//  PreInstructions.swift
//  SwiftCubits
//
//  Created by Arthur Chan on 2/25/24.
//
import SwiftUI
import SceneKit
import ARKit
import UIKit
import Foundation

struct PreInstructions: View{
    @Binding var preInstructionsView: Bool
    //TODO: programmatically assign name to preinstructions
    @State private var sheetView = false
    //MARK: Programmatically pass these into our grid
    let cubitNames = ["Cubit_2-1", "Cubit_2-2", "Cubit_5-4", "Cubit_6-2", "Cubit_7-1"]
    var counter: Int = 0
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Asteroid")
                    .fontWeight(.heavy)
                    .font(.system(size:30))
                    .padding()
                Image("demoShape") //TODO: Replace with asteroid
                    .resizable()
                    .frame(width:330, height:300)
                
            }
            .padding([.bottom], 20)
            HStack{
                Text("Units needed")
                    .fontWeight(.bold)
                    .font(.system(size:20))
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .padding([.leading], 20)
                Spacer()
            }
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                            ForEach(cubitNames, id: \.self) { imageName in
                                //MARK: Temporary fix for programmatic passing
                                if(imageName == "Cubit_2-1"){
                                    GridItemView(imageName: imageName){
                                        SheetView(objectName:imageName)
                                    }
                                }
                                else if(imageName == "Cubit_2-2"){
                                    GridItemView(imageName: imageName){
                                        Cubit_2_2_View(objectName:imageName)
                                    }
                                }
                                else if(imageName == "Cubit_5-4"){
                                    GridItemView(imageName: imageName){
                                        Cubit_5_4_View(objectName:imageName)
                                    }
                                }
                                else if(imageName == "Cubit_6-2"){
                                    GridItemView(imageName: imageName){
                                        Cubit_6_2_View(objectName:imageName)
                                    }
                                }
                                else if(imageName == "Cubit_7-1"){
                                    GridItemView(imageName: imageName){
                                        Cubit_7_1_View(objectName:imageName)
                                    }
                                }
                            }
            }
            .padding()
        }
    }
}

//TODO: PASS INTO THIS OBJECT THE RELATIVE MODEL
struct GridItemView<Content>: View where Content: View{
    @State private var isPresented = false
    let imageName: String
    let content: () -> Content
    
    var body: some View {
        Button(action: {
            isPresented.toggle()
        }) {
            Color("GridColor").opacity(0.28)
                .frame(width:150, height: 150)
                .overlay(
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
        }
        .sheet(isPresented: $isPresented) {
            //TODO: programmatically pass into sheet view the required cubit piece
            content()
                .presentationDetents([.medium, .medium])
        }
    }
}

#Preview(){
    PreInstructions(preInstructionsView: .constant(true))
}
