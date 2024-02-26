//
//  CustomBar.swift
//  SwiftCubits
//
//  Created by Wei Chen on 1/16/24.
//

import SwiftUI



struct CustomBar: View {
    @Binding var selectedTab: Views
    
    var body: some View {
        GeometryReader{ geometry in
            Button(action: {
                selectedTab = .build
            }) {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width:30, height: 30)
                    .foregroundColor(.white)
                    .font(.system(size:50, weight: .heavy))

                
            } .padding()
                .background(Color.customPurple)
                .clipShape(Circle())
                .frame(width:50, height: 50)
                .shadow(color:.gray, radius: 5, x: 0, y:5)
                .offset(x: geometry.size.width * 0.435, y:geometry.size.height * 0.89)
            // left line
            Rectangle()
                .frame(width: 315, height:2)
                .foregroundColor(.gray)
                .opacity(0.25)
                .shadow(color:.black, radius: 3, x: 0, y:-1)
                .offset(x: geometry.size.width * -0.4, y: geometry.size.height * 0.93)
            // right line to parabola
            
            Rectangle()
                .frame(width:305, height:2)
                .foregroundColor(.gray)
                .opacity(0.25)
                .shadow(color:.black, radius: 3, x: 0, y:-1)
                .offset(x: geometry.size.width * 0.6,y: geometry.size.height * 0.93)
            Path { path in
                // parabola; midpoint = 0.5
                // adjust focal width (width of parabola)
                let startX: CGFloat = 0.40 * geometry.size.width
                let endX: CGFloat = 0.60 * geometry.size.width
                
                // adjust 'a value
                let controlY: CGFloat = geometry.size.height * 1.02
                let controlX: CGFloat = geometry.size.width / 2
                
                // adjust starting position of ends
                path.move(to: CGPoint(x: startX, y: geometry.size.height * 0.93))
                path.addQuadCurve(to: CGPoint(x: endX, y: geometry.size.height * 0.93),
                                  control: CGPoint(x: controlX, y: controlY)) // adjust 'a' value
                
            }
            
            .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
            .foregroundColor(Color.gray)
            .opacity(0.25)
            .shadow(color: Color.gray, radius: 5, x: 0, y: 0)
            HStack {
                Button(action: {
                    selectedTab = .home
                }) {
                    Image(systemName: "house.fill")
                        .font(.system(size: 27))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                selectedTab = .home
                            }
                        }
                }
                .foregroundColor(selectedTab == .home ? .customPurple : .gray)
                .offset(x: geometry.size.width * 0.17)
                
                
                
                Button(action: {
                    selectedTab = .profile
                }) {
                    Image(systemName: "person.fill")
                        .font(.system(size: 27))
                    
                }
                .foregroundColor(selectedTab == .profile ? .customPurple : .gray)
                .offset(x: geometry.size.width * 0.62)
                
            }.offset(y: geometry.size.height * 0.96)
        }
    }
    
}

