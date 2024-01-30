//
//  Home.swift
//  SwiftCubits
//
//  Created by Wei Chen on 1/3/24.
//

import SwiftUI

struct Home: View {
    
    @State private var searchPrompt: String = ""
    
    var body: some View {
        ScrollView{
            
            LazyVStack{
                HStack{
                    Text("Welcome back\n")
                        .font(.system(size:16))
                    Text("Peter!")
                        .bold()
                        .font(.system(size:24))
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Image("catFiller")
                        .resizable()
                        .frame(width: 72, height: 72)
                        .clipShape(Circle())
                }
                .padding(20)
                
                HStack {
                    TextField("Search files...", text: $searchPrompt)
                        .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                    Spacer()
                    Image("searchicon")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding([.leading,.trailing], 80)
                
                HStack {
                    Text("Recent Creations")
                        .bold()
                        .font(.system(size: 20))
                        .padding()
                    
                    Spacer()
                }
                HStack {
                    Text("Uploads")
                        .bold()
                        .font(.system(size: 20))
                        .padding()
                    
                    Spacer()
                }
                
            }
        }
        }
    }

#Preview {
    Home()
}
