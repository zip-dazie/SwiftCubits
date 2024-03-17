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
                        Layer1Sheet()
                    }
                    .padding()
                    
                    VStack(){
                        HStack{
                            Text("Units")
                                .bold()
                                .font(.system(size:20))
                                .padding([.leading], 20)
                            
                            Spacer()
                        }
                        .padding([.top], 30)
                        
                        //Cubits pieces
                        HStack{
                            Image("sCubit6-2")
                                .resizable()
                                .scaledToFit()
                                .frame(width:65, height: 50)
                                .padding([.top,.bottom],20)
                                .border(.black)
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
                        }
                        .frame(width:340, height: 100)
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
                                Cubit_5_4_View(objectName: "Cubit_5-4")
                            }
                            .presentationDetents([.medium, .medium])
                            
                            
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
                            sheetArray[0].toggle()
                        }){
                            Image("Layer1-1")
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[0]){
                            Cubit_5_4_View(objectName: "Cubit_5-4")
                        }
                        .presentationDetents([.medium, .medium])
                        
                        
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
                            sheetArray[0].toggle()
                        }){
                            Image("Layer1-1")
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[0]){
                            Cubit_5_4_View(objectName: "Cubit_5-4")
                        }
                        .presentationDetents([.medium, .medium])
                        
                        
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
                            sheetArray[0].toggle()
                        }){
                            Image("Layer1-1")
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[0]){
                            Cubit_5_4_View(objectName: "Cubit_5-4")
                        }
                        .presentationDetents([.medium, .medium])
                        
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
                            sheetArray[0].toggle()
                        }){
                            Image("Layer1-1")
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[0]){
                            Cubit_5_4_View(objectName: "Cubit_5-4")
                        }
                        .presentationDetents([.medium, .medium])
                        
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
                        sheetArray[0].toggle()
                    }){
                        Image("Layer1-1")
                            .padding()
                    }
                    .sheet(isPresented: $sheetArray[0]){
                        Cubit_5_4_View(objectName: "Cubit_5-4")
                    }
                    .presentationDetents([.medium, .medium])
                    
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


#Preview {
    Layer_1()
}
