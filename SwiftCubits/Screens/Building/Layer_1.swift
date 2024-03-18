//
//  Layer_1.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 3/10/24.
//

import SwiftUI
struct Layer_1: View {
    @State private var isLayerPresented = false;
    @State private var sheetArray = Array(repeating: false, count: 6)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Color.clear.frame(width: 30, height: 30)
                        Spacer()
                        Text("Layer 1")
                            .font(.system(size: 27, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Spacer()
                        NavButton(destination: Layer_2(), icon: "rightArrow")
                            .frame(width: 30, height: 30, alignment: .trailing)
                    }
                    .padding()
                    
                    HStack{
                        Button(action: {
                            isLayerPresented.toggle();
                        }){
                            Image("Layer1")
                                .offset(y:30)
                        }
                    }
                    .sheet(isPresented:$isLayerPresented){
                        Layer1_6Sheet()
                    }
                    .padding()
                    
//                    UnitViewer()
                        
                        //Cubits pieces
                        HStack{
                            Image("sCubit6-2")
                                .resizable()
                                .scaledToFit()
                                .frame(width:65, height: 50)
                                .padding([.top,.bottom],20)
                                .padding([.leading], 20)
//                                .border(.black)
                            Image("sCubit7-1")
                                .resizable()
                                .scaledToFit()
                                .frame(width:45, height: 45)
                                .padding()
                            Image("sCubit5-4")
                                .resizable()
                                .scaledToFit()
                                .frame(width:50, height: 50)
                                .padding()
                            Spacer()
                        }
                        .frame(width:340, height: 100)
                        .alignmentGuide(.leading){ _ in
                            return -100
                        }
                        .background(Color("GridColor").opacity(0.28))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                        HStack{
                            Text("Instructions")
                                .bold()
                                .font(.system(size:20))
                                .padding([.leading], 20)
                            Spacer()
                        }
                        .padding([.top], 10)
                        
                        //Instructions
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
                                Image("Layer1-1")
                                    .padding()
                            }
                            .sheet(isPresented: $sheetArray[0]){
                                Layer1Sheet()
                                    .presentationDetents([.medium, .medium])
                            }
                            
                            
                            // Border at the bottom
                            Rectangle()
                                .frame(width: 310, height: 1)
                                .foregroundColor(.borderGray)
                        }
                        
                        HStack{
                            Text("2.")
                                .padding([.leading,.top], 30)
                            Spacer()
                        }
                        
                        // Content of the card
                        Button(action: {
                            sheetArray[1].toggle()
                        }){
                            Image("Layer1-2")
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[1]){
                            Layer1_2Sheet()
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
                            Image("Layer1-3")
                                .padding()
                                .offset(x:7)
                        }
                        .sheet(isPresented: $sheetArray[2]){
                            Layer1_3Sheet()
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
                            Image("Layer1-4")
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[3]){
                            Layer1_4Sheet()
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
                            Image("Layer1-5")
                                .offset(x:-8)
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[4]){
                            Layer1_5Sheet()
                                .presentationDetents([.medium, .medium])
                        }
                        
                        
                        // Border at the bottom
                        Rectangle()
                            .frame(width: 310, height: 1)
                            .foregroundColor(.borderGray)
                        
                    }
                    HStack{
                        Text("6.")
                            .padding([.leading,.top], 30)
                        Spacer()
                    }
                    
                    // Content of the card
                    Button(action: {
                        sheetArray[5].toggle()
                    }){
                        Image("Layer1-6")
                            .padding()
                    }
                    .sheet(isPresented: $sheetArray[5]){
                        Layer1_6Sheet()
                            .presentationDetents([.medium, .medium])
                    }
                    
                    
                    // Border at the bottom
                    Rectangle()
                        .frame(width: 310, height: 1)
                        .foregroundColor(.borderGray)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }



//MARK: Programmatic assignment of layer fails
struct BottomBorderCard: View {
    var body: some View {
        VStack(spacing: 0) {
            // Content of the card
            Image("Layer1-1")
                .padding()
            
            // Border at the bottom
            Rectangle()
                .frame(width: 310, height: 1)
                .foregroundColor(.borderGray)
        }
    }
}

//TODO: to Insert a 3D model, use the url in the PARENT(not here) struct declarations, quantity is hard-coded
struct UnitViewer_1: View {
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


struct UnitView_1: View {
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

struct ModelPlaceholderIcon_1: View {
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
    Layer_1()
}
