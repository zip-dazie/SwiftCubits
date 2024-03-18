//
//  Layer_3.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 3/10/24.
//

import SwiftUI

struct Layer_3: View {
    @State private var isLayerPresented = false;
    @State private var sheetArray = Array(repeating: false, count: 6)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        NavButton(destination: Layer_2(), icon: "leftArrow")
                        Spacer()
                        Text("Layer 3")
                            .font(.system(size: 27, weight: .bold))
                        Spacer()
                        NavButton(destination: Layer_4(), icon: "rightArrow")
                    }
                    .padding(.horizontal)
                    
                    //Header
                    HStack{
                        Button(action: {
                            isLayerPresented.toggle();
                        }){
                            Image("Layer3")
                                .offset(y:30)
                        }
                    }
                    .sheet(isPresented:$isLayerPresented){
                        Layer1_6Sheet()
                    }
                    .padding()
                    
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
                    .frame(width:340, height: 150)
                    .background(Color("GridColor").opacity(0.28))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                 
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
                            Image("Layer3-1")
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
                        
                        HStack{
                            Text("2.")
                                .padding([.leading,.top], 30)
                            Spacer()
                        }
                        // Content of the card
                        Button(action: {
                            sheetArray[1].toggle()
                        }){
                            Image("Layer3-2")
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[1]){
                            Layer1Sheet()
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
                            Image("Layer3-3")
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[2]){
                            Layer1Sheet()
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
                            Image("Layer3-4")
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[3]){
                            Layer1Sheet()
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
                            Image("Layer3-5")
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[4]){
                            Layer1Sheet()
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
                            Image("Layer3-6")
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[5]){
                            Layer1Sheet()
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
                            Image("Layer3-7")
                                .padding()
                        }
                        .sheet(isPresented: $sheetArray[6]){
                            Layer1Sheet()
                                .presentationDetents([.medium, .medium])
                        }
                        // Border at the bottom
                        Rectangle()
                            .frame(width: 310, height: 1)
                            .foregroundColor(.borderGray)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}
#Preview {
    Layer_3()
}
