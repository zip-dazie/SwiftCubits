//
//  ContentView.swift
//  SwiftCubits
//
//  Created by Ethan Chen on 1/3/24.
//

import SwiftUI

struct ContentView: View {
    
    //authmodel will save signinview state locally
    @State private var showSignInView: Bool = false
    
    
    @State private var selectedTab: Views = .home
    var body: some View {
            ZStack {
                // Main content
                switch selectedTab {
                case .home:
                    NavigationStack {
                        Home()
                        //MARK: THIS CLASS IS INCLUDED FOR TEMP FUNCTIONALITY
                        
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
//            .onAppear{
//                let authUser = try? AuthManager.shared.getAuthUser()
//                self.showSignInView = authUser == nil ? true : false
//            }
//            .fullScreenCover(isPresented: $showSignInView, content: {
//                NavigationStack{
//                    AuthView()
//                }
//            })
        }
}

#Preview {
    ContentView()
}
