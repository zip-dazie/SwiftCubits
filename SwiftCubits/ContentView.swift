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
                    }
                case .profile:
                    NavigationStack {
                        Profile(showSignInView: $showSignInView)
                    }
                case .build:
                    NavigationStack {
                        Build()
                            //
                            //.environmentObject(AuthManager)
                    }
                }

                VStack {
                    CustomBar(selectedTab: $selectedTab)
                }
            }
        //MARK: RE ADD THIS WHEN READY
            .onAppear{
                let authUser = try? AuthManager.shared.getAuthUser()
                self.showSignInView = authUser == nil ? true : false
            }
            
            .fullScreenCover(isPresented: $showSignInView, content: { //bind to showSigninView
                NavigationStack{
                    AuthView()
                }
            })
        }
}

#Preview {
    ContentView()
}
