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
    //private var shapeName: String
    //    @State var primarySCNScene = SingleCubitView()
    @State private var sheetView = false
    @State private var next = false
    //MARK: Programmatically pass these into our grid
    let cubitNames = ["Cubit2-1", "Cubit2-2", "Cubit5-4", "Cubit6-2", "Cubit7-1"]
    var counter: Int = 0
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Text("Asteroid")
                        .fontWeight(.heavy)
                        .font(.system(size:30))
                        .padding()
                    Image("AsteroidLayer") //TODO: Replace with asteroid
                        .offset(x:-15)
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
                                    if(imageName == "Cubit2-1"){
                                        GridItemView<SheetView>(imageName: imageName){
                                            SheetView(objectName:imageName)
                                        }
                                    }
                                    else if(imageName == "Cubit2-2"){
                                        GridItemView(imageName: imageName){
                                            Cubit_2_2_View(objectName:imageName)
                                        }
                                    }
                                    else if(imageName == "Cubit5-4"){
                                        GridItemView(imageName: imageName){
                                            Cubit_5_4_View(objectName:imageName)
                                        }
                                    }
                                    else if(imageName == "Cubit6-2"){
                                        GridItemView(imageName: imageName){
                                            Cubit_6_2_View(objectName:imageName)
                                        }
                                    }
                                    //MARK: Unknown render error
                                    else if(imageName == "Cubit7-1"){
                                        GridItemView(imageName: imageName){
                                            Cubit_7_1_View(objectName:imageName)
                                        }
                                    }
                                }
                }
        }
            .padding()
            NavButton(destination:Layer_1(), icon: "rightArrow", linkText: "Next")
                .padding(.leading,20)
        
        
            
           
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
//                        .resizable()
                        .offset(x:-5)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height:100)
                        
                    
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
