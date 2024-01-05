//
//  Build.swift
//  SwiftCubits
//
//  Created by Wei Chen on 1/5/24.
//

import SwiftUI

struct Build: View {
    var body: some View {
        NavigationLink{
            Instructions()
        } label: {
            Image(systemName:"plus")
                .resizable()
                .frame(width:30, height: 30)
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.blue)
        .clipShape(Circle())
    }
    
}

#Preview {
    Build()
}
