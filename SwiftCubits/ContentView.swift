//
//  ContentView.swift
//  SwiftCubits
//
//  Created by Wei Chen on 1/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isGenerate = false
    var body: some View {
        ZStack{
            TabView{
                
                Home()
                    .tabItem(){
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                Profile()
                    .tabItem(){
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                
            }
            
            Button {
                NavigationLink("Go to Options") {
                    Options()
                }
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.blue)
            .clipShape(Circle())
            .offset(y: 325)
        }
        
    }
}




#Preview {
    ContentView()
}


