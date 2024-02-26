//
//  ContentView.swift
//  SwiftCubits
//
//  Created by Ethan Chen on 1/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showSignInView: Bool = false
    @ObservedObject var tabSelection: TabSelection

    var body: some View {
        ZStack {
            switch tabSelection.selectedTab {
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
                        //.environmentObject(AuthManager)
                }
            }

            VStack {
                CustomBar(selectedTab: $tabSelection.selectedTab)
            }
        }
        .onAppear {
            let authUser = try? AuthManager.shared.getAuthUser()
            self.showSignInView = authUser == nil ? true : false
        }
        .fullScreenCover(isPresented: $showSignInView, content: {
            NavigationStack {
                AuthView(showSignInView: $showSignInView)
            }
        })
    }
}

#Preview {
    ContentView(tabSelection: TabSelection())
}
