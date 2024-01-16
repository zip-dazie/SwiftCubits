//
//  Test.swift
//  SwiftCubits
//
//  Created by Wei Chen on 1/15/24.
//

import SwiftUI


struct testView: View{
    var body: some View{
        Text("this is a test")
    }
}

struct Test: View {
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink{
                    Home()
                } label: {
                    Image(systemName: "house.fill")
                }
            }
        }
    }
}

#Preview {
    Test()
}
