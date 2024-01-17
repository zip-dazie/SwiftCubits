//
//  ContentView.swift
//  SwiftCubits
//
//  Created by Ethan Chen on 1/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Views = .home
    var body: some View {
        switch selectedTab {
        case .home:
            NavigationStack{
                VStack{
                    Home()
                    Spacer()
                }
               
            }
        case .profile:
            NavigationStack{
                VStack{
                    Profile()
                    Spacer()
                }
                
            }
        case .build:
            NavigationStack{
                VStack{
                    Build()
                    Spacer()
                }
               
            }
        }
        CustomBar(selectedTab: $selectedTab)
            .frame(width: .infinity)
        
        
    }
    
}
#Preview {
    ContentView()
}
