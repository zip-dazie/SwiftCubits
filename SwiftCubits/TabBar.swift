//
//  TabBar.swift
//  SwiftCubits
//
//  Created by Wei Chen on 1/15/24.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case person
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "house.fill")
                .foregroundColor(selectedTab == .house ? .purple : .gray)
                .font(.system(size: 25))
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.1)) {
                        selectedTab = .house
                    }
                }
            Spacer()
            Spacer()
            Image(systemName: "person.fill")
                .foregroundColor(selectedTab == .person ? .purple : .gray)
                .font(.system(size: 25))
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.1)) {
                        selectedTab = .person
                    }
                }
            Spacer()
        }
        .frame(height: 60)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.house))
    }
}
