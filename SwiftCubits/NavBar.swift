//
//  NavBar.swift
//  SwiftCubits
//
//  Created by Wei Chen on 1/9/24.
//

import SwiftUI

struct NavBar: View {
    @State private var paths = NavigationPath()
    var body: some View {
        VStack{
            GeometryReader { geometry in
                // navbar buttons
                // Build
                NavigationStack(path: $paths){
                    ZStack{
                        NavigationLink{
                            Build()
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width:30, height: 30)
                                .foregroundColor(.white)
                                .font(.system(size:50, weight: .heavy))
                        }
                        .padding()
                        .background(Color(red: 89.0/255, green: 95.0/255, blue: 232.0/255))
                        .clipShape(Circle())
                        .frame(width:50, height: 50)
                        .offset(x: geometry.size.width * 0, y:geometry.size.height * 0.86)
                        .shadow(color:.gray, radius: 5, x: 0, y:5)
                        HStack{
                            //Home
                            NavigationLink{
                                Home()
                                    .navigationBarBackButtonHidden(true)
                            } label: {
                                Image(systemName: "house.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:50, height: 30)
                                    .colorMultiply(.black)
                                    .brightness(0.30)
                            }
                            .frame(width:30, height: 30)
                            .offset(x: geometry.size.width * -0.25, y:geometry.size.height * 0.91)
                            // Profile
                            NavigationLink{
                                Profile()
                                    .navigationBarBackButtonHidden(true)
                            } label: {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 25)
                                    .frame(width:50, height: 30)
                                    .colorMultiply(.black)
                                    .brightness(0.30)
                            }
                            .frame(width:30, height: 30)
                            .offset(x: geometry.size.width * 0.25, y:geometry.size.height * 0.91)
                        }
                    }
                    // left line to parabola
                    Rectangle()
                        .frame(width: 315, height:2)
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .shadow(color:.black, radius: 3, x: 0, y:-1)
                        .offset(x: geometry.size.width * -0.5, y: geometry.size.height * 0.82)
                    // right line to parabola
                    Rectangle()
                        .frame(width:305, height:2)
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .shadow(color:.black, radius: 3, x: 0, y:-1)
                        .offset(x: geometry.size.width * 0.49,y: geometry.size.height * 0.81)
                    Path { path in
                        // parabola; midpoint = 0.5
                        // adjust focal width (width of parabola)
                        let startX: CGFloat = 0.40 * geometry.size.width
                        let endX: CGFloat = 0.60 * geometry.size.width
                        
                        // adjust 'a value
                        let controlY: CGFloat = geometry.size.height * 0.88
                        let controlX: CGFloat = geometry.size.width / 2
                        
                        // adjust starting position of ends
                        path.move(to: CGPoint(x: startX, y: geometry.size.height * 0.8))
                        path.addQuadCurve(to: CGPoint(x: endX, y: geometry.size.height * 0.8),
                                          control: CGPoint(x: controlX, y: controlY)) // adjust 'a' value
                        
                    }
                    
                    .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.gray)
                    .opacity(0.25)
                    .shadow(color: Color.gray, radius: 5, x: 0, y: 0)
                    
                    
                }
                
            }
        }        .edgesIgnoringSafeArea(.bottom)
        
    }
    
}

#Preview {
    NavBar()
}
