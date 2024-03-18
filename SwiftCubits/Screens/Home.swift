//
//  Home.swift
//  SwiftCubits
//
//  Created by Wei Chen on 1/3/24.
//

import SwiftUI

struct Home: View {
    @State private var preInstructionsView = false
    @State private var searchPrompt: String = ""

    var body: some View {
        ScrollView{
            
            LazyVStack{
                // Welcome Text with profile picture
                HStack{
                    VStack(alignment: .leading) {
                        Text("Welcome back\n").navigationBarBackButtonHidden(true)

                            .font(.system(size:16))
                        
                        Text("Peter!")
                            .bold()
                            .font(.system(size:24))
                    }
                    Spacer()
                    Image("catFiller")
                        .resizable()
                        .frame(width: 54, height: 54)
                        .clipShape(Circle())
                }
                .padding(20)
                
                //Search Textfield and search button
                HStack(spacing: 0) {
                    TextField("Search files...", text: $searchPrompt)
                        .disableAutocorrection(true)
                        .font(.system(size: 16))
                        .padding([.leading], 15)
                        .padding([.vertical], 10)
                        .background(
                            UnevenRoundedRectangle(
                                cornerRadii: .init(
                                    topLeading: 5,
                                    bottomLeading: 5)
                            )
                            .fill(Color("CustomGray")))
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    Button(action: {
                        print(searchPrompt)
                    }){
                        Image("searchicon")
                            .resizable()
                            .frame(width: 15.0, height: 15.0)
                            .padding([.horizontal], 13.0)
                            .padding([.vertical], 13.0)
                            .background(UnevenRoundedRectangle(
                                cornerRadii: .init(
                                    bottomTrailing: 5,
                                    topTrailing: 5)
                            )
                                .fill(Color("CustomGray")))
                    }
                    
                }
                .padding([.horizontal], 20)
                
                //subheading
                HStack {
                    Text("Recent Creations")
                        .bold()
                        .font(.system(size: 20))
                        .padding()
                    
                    Spacer()
                }
                //two recent creations
                HStack {
                    //first creation is the demo shape
                    Button(action: {
                        print("Main Button Tapped")
                        preInstructionsView = true;
                        
                    }) {
                        VStack {
                            Image("demoShape")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 131, height: 98)
                                .padding(.top)
                            Spacer()
                        }
                        .frame(width: 163, height: 163)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            VStack {
                                Spacer()
                                HStack {
                                    Text("13 MB")
                                        .foregroundColor(.black)
                                    Spacer()
                                    Button(action: {
                                        print("Nested Button Tapped")
                                    }) {
                                        Image("horizontaldots")
                                            .frame(width: 24, height: 24)
                                    }
                                }
                                .padding([.leading, .bottom, .trailing])
                            }
                        )
                    }
                    .shadow(color: .gray, radius: 5, x:0, y:0)
                    .padding(.leading, 20)
                    .padding(.trailing, 10)
                    .fullScreenCover(isPresented: $preInstructionsView, content:{
                        NavigationView{
                            PreInstructions(preInstructionsView: $preInstructionsView)
                        }
                    })
                    
                    Spacer()
                    // second creation with skull shape
                    Button(action: {
                        print("Main Button Tapped")
                    }) {
                        VStack {
                            Image("skullShape")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 131, height: 98)
                                .padding(.top)
                            Spacer()
                        }
                        .frame(width: 163, height: 163) // Square frame
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            VStack {
                                Spacer()
                                HStack {
                                    Text("36 MB")
                                        .foregroundColor(.black)
                                    Spacer()
                                    Button(action: {
                                        print("Nested Button Tapped")
                                    }) {
                                        Image("horizontaldots")
                                            .frame(width: 24, height: 24)
                                    }
                                }
                                .padding([.leading, .bottom, .trailing])
                            }
                        )
                    }
                    .shadow(color: .gray, radius: 5, x:0, y:0)
                    .padding(.trailing, 20)
                    .padding(.leading, 10)
                }
                
                //sub heading
                HStack {
                    Text("Uploads")
                        .bold()
                        .font(.system(size: 20))
                        .padding()
                    
                    Spacer()
                }
                
                // uploads
                //3D Model Picture
                Button(action: {
                    // Action for the main button
                    print("Main Button Tapped")
                }) {
                    HStack {
                        Image("asteroidIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 65.0)
                            .padding([.top, .leading, .bottom])
                        
                        VStack {
                            HStack {
                                Text("Asteroid")
                                    .bold()
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            HStack{
                                Text("5.4 MB")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                Text("Upload Complete")
                                    .font(.system(size: 14))
                                    .foregroundColor(.green)
                                Spacer()
                            }
                        }
                        
                        Spacer()
                    }
                    .frame(width: 342, height: 65)
                    .background(Color("CustomGray"))
                    .cornerRadius(10)
                    .overlay(
                        HStack {
                            Spacer()
                            Button(action: {
                                print("Nested Button Tapped")
                            }) {
                                Image("verticaldots")
                                    .frame(width: 24, height: 24)
                                    .padding(.trailing)
                            }
                        }
                    )
                }
                .padding(.vertical, 5.0)
                
                //Mountain
                Button(action: {
                    // Action for the main button
                    print("Main Button Tapped")
                }) {
                    HStack {
                        Image("cubeIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 65.0)
                            .padding([.top, .leading, .bottom])
                        
                        VStack {
                            HStack {
                                Text("Cube")
                                    .bold()
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            HStack{
                                Text("2.3 MB")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                Text("Upload Complete")
                                    .font(.system(size: 14))
                                    .foregroundColor(.green)
                                Spacer()
                            }
                        }
                        
                        Spacer()
                    }
                    .frame(width: 342, height: 65)
                    .background(Color("CustomGray"))
                    .cornerRadius(10)
                    .overlay(
                        HStack {
                            Spacer()
                            Button(action: {
                                print("Nested Button Tapped")
                            }) {
                                Image("verticaldots")
                                    .frame(width: 24, height: 24)
                                    .padding(.trailing)
                            }
                        }
                    )
                }
                
                .padding(.vertical, 5.0)
                
                //Human Figure
                Button(action: {
                    // Action for the main button
                    print("Main Button Tapped")
                }) {
                    HStack {
                        Image("skullIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 65.0)
                            .padding([.top, .leading, .bottom])
                        
                        VStack {
                            HStack {
                                Text("Skull")
                                    .bold()
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            HStack{
                                Text("7.2 MB")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                Text("Upload Complete")
                                    .font(.system(size: 14))
                                    .foregroundColor(.green)
                                Spacer()
                            }
                        }
                        
                        Spacer()
                    }
                    .frame(width: 342, height: 65)
                    .background(Color("CustomGray"))
                    .cornerRadius(10)
                    .overlay(
                        HStack {
                            Spacer()
                            Button(action: {
                                print("Nested Button Tapped")
                            }) {
                                Image("verticaldots")
                                    .frame(width: 24, height: 24)
                                    .padding(.trailing)
                            }
                        }
                    )
                }
                
                .padding(.vertical, 5.0)
                
                
            }
        }.padding(.bottom, 53)
    }
}

#Preview {
    Home()
}
