//
//  Layer_2.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 3/10/24.
//

import SwiftUI

struct Layer_2: View {
    @State private var isLayerPresented = false;
    @State private var sheetArray = Array(repeating: false, count: 8)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        NavButton(destination: Layer_1(), icon: "leftArrow")
                        Spacer()
                        Text("Layer 2")
                            .font(.system(size: 27, weight: .bold))
                        Spacer()
                        NavButton(destination: Layer_3(), icon: "rightArrow")
                    }
                    .padding(.horizontal)
                    
                    //Header
                    HStack{
                        Button(action: {
                            isLayerPresented.toggle();
                        }){
                            Image("Layer2")
                                .offset(y:30)
                        }
                    }
                    .sheet(isPresented:$isLayerPresented){
                        Layer2Sheet()
                    }
                    .padding()
                    
                    //Cubits pieces
                    UnitViewer_2()
                        .padding([.top],20)
                    
                    //Instructions
                    HStack{
                        Text("Instructions")
                            .bold()
                            .font(.system(size:20))
                            .padding([.leading], 20)
                        Spacer()
                    }
                    .padding([.top], 10)
                    
                    VStack{
                        HStack{
                            Text("1.")
                                .padding([.leading,.top], 30)
                            Spacer()
                        }
                        // Content of the card
                        Button(action: {
                            sheetArray[0].toggle()
                        }){
                            Image("Layer2-1")
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[0]){
                            Layer2_1Sheet()
                                .presentationDetents([.medium, .medium])
                        }
                        // Border at the bottom
                        Rectangle()
                            .frame(width: 310, height: 1)
                            .foregroundColor(.borderGray)
                        
                        
                        HStack{
                            Text("2.")
                                .padding([.leading,.top], 30)
                            Spacer()
                        }
                        // Content of the card
                        Button(action: {
                            sheetArray[1].toggle()
                        }){
                            Image("Layer2-2")
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[1]){
                            Layer2_2Sheet()
                                .presentationDetents([.medium, .medium])
                        }
                        // Border at the bottom
                        Rectangle()
                            .frame(width: 310, height: 1)
                            .foregroundColor(.borderGray)
                        
                        HStack{
                            Text("3.")
                                .padding([.leading,.top], 30)
                            Spacer()
                        }
                        // Content of the card
                        Button(action: {
                            sheetArray[2].toggle()
                        }){
                            Image("Layer2-3")
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[2]){
                            Layer2_3Sheet()
                                .presentationDetents([.medium, .medium])
                        }
                        // Border at the bottom
                        Rectangle()
                            .frame(width: 310, height: 1)
                            .foregroundColor(.borderGray)
                        
                        
                        HStack{
                            Text("4.")
                                .padding([.leading,.top], 30)
                            Spacer()
                        }
                        // Content of the card
                        Button(action: {
                            sheetArray[3].toggle()
                        }){
                            Image("Layer2-4")
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[3]){
                            Layer2_4Sheet()
                                .presentationDetents([.medium, .medium])
                        }
                        // Border at the bottom
                        Rectangle()
                            .frame(width: 310, height: 1)
                            .foregroundColor(.borderGray)
                        
                        HStack{
                            Text("5.")
                                .padding([.leading,.top], 30)
                            Spacer()
                        }
                        // Content of the card
                        Button(action: {
                            sheetArray[4].toggle()
                        }){
                            Image("Layer2-5")
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[4]){
                            Layer2_5Sheet()
                                .presentationDetents([.medium, .medium])
                        }
                        // Border at the bottom
                        Rectangle()
                            .frame(width: 310, height: 1)
                            .foregroundColor(.borderGray)
                        
                        HStack{
                            Text("6.")
                                .padding([.leading,.top], 30)
                            Spacer()
                        }
                        // Content of the card
                        Button(action: {
                            sheetArray[5].toggle()
                        }){
                            Image("Layer2-6")
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[5]){
                            Layer2_6Sheet()
                                .presentationDetents([.medium, .medium])
                        }
                        // Border at the bottom
                        Rectangle()
                            .frame(width: 310, height: 1)
                            .foregroundColor(.borderGray)
                        
                        HStack{
                            Text("7.")
                                .padding([.leading,.top], 30)
                            Spacer()
                        }
                        // Content of the card
                        Button(action: {
                            sheetArray[6].toggle()
                        }){
                            Image("Layer2-7")
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[6]){
                            Layer2_7Sheet()
                                .presentationDetents([.medium, .medium])
                        }
                        // Border at the bottom
                        Rectangle()
                            .frame(width: 310, height: 1)
                            .foregroundColor(.borderGray)
                        
                        HStack{
                            Text("8.")
                                .padding([.leading,.top], 30)
                            Spacer()
                        }
                        // Content of the card
                        Button(action: {
                            sheetArray[7].toggle()
                        }){
                            Image("Layer2-8")
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[7]){
                            Layer2_8Sheet()
                                .presentationDetents([.medium, .medium])
                        }
                        // Border at the bottom
                        Rectangle()
                            .frame(width: 310, height: 1)
                            .foregroundColor(.borderGray)
                        
                        
                    //end of VStack
                    }
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            }
        }
    }
}

//
//  ModelView.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 3/16/24.
//



//TODO: to Insert a 3D model, use the url in the PARENT(not here) struct declarations, quantity is hard-coded
struct UnitViewer_2: View {
    let placeholders = [
        ModelPlaceholder(label: "6x", modelURL: "Icon1"),
        ModelPlaceholder(label: "2x", modelURL: "Icon2"),
        ModelPlaceholder(label: "6x", modelURL: "Icon3"),
        ModelPlaceholder(label: "4x", modelURL: "Icon4"),
        ModelPlaceholder(label: "4x", modelURL: "Icon5")
    ]

    var body: some View {
       
            UnitView_2(modelPlaceholders: placeholders)
        }
    }


struct UnitView_2: View {
    var modelPlaceholders: [ModelPlaceholder]
    let itemWidth: CGFloat = 70
    let spacing: CGFloat = 7.5
    let gridPadding: CGFloat = 8
    let horizontalPadding: CGFloat = 20

    private var columns: [GridItem] {
        let availableWidth = UIScreen.main.bounds.width - (2 * horizontalPadding) - (spacing * 3)
        let numberOfItemsInRow = Int(availableWidth / (itemWidth + spacing))
        return Array(repeating: .init(.fixed(itemWidth)), count: max(numberOfItemsInRow, 1))
    }

    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 0) {
                Spacer()
                Spacer()
                Text("Units")
                    .font(.system(size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                Spacer()
            }
        }
        LazyVGrid(columns: columns, alignment: .center, spacing: spacing) {
            ForEach(modelPlaceholders) { modelPlaceholder in
                ModelPlaceholderIcon(placeholder: modelPlaceholder)
                    .frame(width: itemWidth, height: itemWidth)
            }
        }
        .padding([.horizontal, .vertical], gridPadding)
        .background(Color("GridColor").opacity(0.28))
        .cornerRadius(10)
        .padding(.horizontal, 20)
    }
}

struct ModelPlaceholderIcon: View {
    var placeholder: ModelPlaceholder
    @State private var showModel = false

    var body: some View {
        Button(action: {
            showModel = true
        }) {
            ZStack {
                //TODO: color is for UI design, change to clear after rendering --> Color.clear
                Image(placeholder.modelURL!)
            }
//            .overlay(
//                Text(placeholder.label)
//                    .foregroundColor(Color.black.opacity(0.7))
//                          .font(.system(size: 18))
//                          .padding(5),
//                alignment: .topLeading
//            )
            //TODO: render the preview of the model
        }
    }
}


#Preview {
    Layer_2()
}
