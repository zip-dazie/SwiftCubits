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
    let cubitNames = ["Cubit_2-1", "Cubit_2-2", "Cubit_5-4", "Cubit_6-2", "Cubit_7-1"]
    var body: some View {
        NavigationStack{
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
                    ForEach(cubitNames, id:\.self) { imageName in
                        GridItemView(imageName: imageName) //TODO: See griditemView
                    }
                }
                .padding()
                NavigationLink(destination: Layer_1()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color.customPurple)
                            .frame(width: 100, height: 50)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                        Image(systemName: "arrow.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 50)
                            .foregroundColor(.white)
                    }
                }
                .padding(.leading, 20)
            }
            
           
        }
    }
}

//TODO: PASS INTO THIS OBJECT THE RELATIVE MODEL
struct GridItemView: View {
    @State private var isPresented = false
    let imageName: String
    
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
        //["Cubit_2-1", "Cubit_2-2", "Cubit_5-4", "Cubit_6-2", "Cubit_7-1"]
        .sheet(isPresented: $isPresented) {
            //TODO: programmatically pass into sheet view the required cubit piece
            Cubit_7_1_View(objectName: "CTest.scn")
                .presentationDetents([.medium, .medium])
        }
        
    }
}
/*
 NavigationStack {
 ScrollView {
 VStack(alignment: .leading, spacing: 20) {
 Text("Layer 1").navigationBarBackButtonHidden(true)
 .font(.title)
 .fontWeight(.bold)
 .padding(.top)
 .padding(.leading, 20)
 NavigationLink(destination: Layer_2()) {
 ZStack {
 RoundedRectangle(cornerRadius: 15)
 .foregroundColor(Color.customPurple)
 .frame(width: 100, height: 50)
 .shadow(color: .gray, radius: 5, x: 0, y: 5)
 Image(systemName: "arrow.right")
 .resizable()
 .aspectRatio(contentMode: .fit)
 .frame(width: 20, height: 50)
 .foregroundColor(.white)
 }
 }
 .padding(.leading, 20)
 }
 }
 }
 */

#Preview(){
    PreInstructions(preInstructionsView: .constant(true))
}
