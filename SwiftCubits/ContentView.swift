//
//  ContentView.swift
//  SwiftCubits
//
//  Created by Wei Chen on 1/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Int = 0
    var body: some View {
        TabView (selection: $selection) {
            NavigationView{
                Home()
            }
                .tabItem {
                    Image(systemName: "house.fill")
                }
                .tag(0)
                .navigationBarHidden(selection == 0)
            
            NavigationView{
                Build()
            }
            .tabItem{
                Image(systemName: "plus")
            }
            .tag(1)
            .navigationBarHidden(selection == 1)
            NavigationView{
                Profile()
            }
                .tabItem {
                    Image(systemName: "person.fill")
                }
                .tag(2)
                .navigationBarHidden(selection == 2)
        }
    }
}



#Preview {
    ContentView()
}


/*
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
 */
