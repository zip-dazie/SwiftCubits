//
//  Layer_1.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 3/10/24.
//

import SwiftUI
struct Layer_1: View {
    @State private var isLayerPresented = false;
    
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
                        
                        //Cubits pieces
                        HStack{
                            
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
                        
                        VStack{
                            HStack{
                                Text("1")
                                    .padding([.leading,.top], 30)
                                Spacer()
                            }
                            
                            // Content of the card
                            Image("Layer1-1")
                                .padding()
                            
                            // Border at the bottom
                            Rectangle()
                                .frame(width: 310, height: 1)
                                .foregroundColor(.borderGray)
                        }
                        
                        
                    }
                    .padding([.top], 30)
                }
                
                    
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}

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
