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
    @State var primarySCNScene = SingleCubitView()
    @State private var sheetView = false
    
    
    //MARK: Programmatically pass these into our grid
    let imageNames = ["image1", "image2", "image3", "image4"]
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Asteroid")
                    .fontWeight(.heavy)
                    .font(.system(size:30))
                    .padding()
                Image(systemName: "square.and.arrow.down.fill") //TODO: Replace with asteroid
                    .resizable()
                    .frame(width:200, height:200)
                
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
                            ForEach(imageNames, id:\.self) { imageName in
                                GridItemView(imageName: imageName) //TODO: See griditemView
                            }
            }
            .padding()
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
        .sheet(isPresented: $isPresented) {
            SheetView(imageName: imageName)
                .presentationDetents([.medium, .medium])
        }
    }
}

#Preview(){
    PreInstructions()
}
