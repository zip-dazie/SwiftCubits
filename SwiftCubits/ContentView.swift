//
//  ContentView.swift
//  SwiftCubits
//
//  Created by Ethan Chen on 1/3/24.
//

import SwiftUI

struct ContentView: View {
    
    //TODO: Include default sign in state, AuthModel will save auth locally
    
    @State private var selectedTab: Views = .home
    var body: some View {
            ZStack {
                // Main content
                switch selectedTab {
                case .home:
                    NavigationStack {
                        Home()
                    }
                case .profile:
                    NavigationStack {
                        Profile()
                    }
                case .build:
                    NavigationStack {
                        Build()
                    }
                }

                VStack {
                    CustomBar(selectedTab: $selectedTab)
                }
            }
        }
}

#Preview {
    ContentView()
}
