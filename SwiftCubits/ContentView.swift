//
//  ContentView.swift
//  SwiftCubits
//
//  Created by Ethan Chen on 1/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavOutline()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct NavOutline: View {
    var body: some View {
        /*
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
         */
        GeometryReader { geometry in
            // navbar buttons
            // Build
            ZStack{
                Button{
                    print("Build")
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
                .offset(x: geometry.size.width * 0, y:geometry.size.height * 0.39)
                .shadow(color:.gray, radius: 5, x: 0, y:5)
                HStack{
                    //Home
                    Button{
                        print("Home")
                    } label: {
                        Image(systemName: "house")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:50, height: 30)
                            .colorMultiply(Color(red:75/255, green:75/255, blue: 75/255))
                    }
                    .frame(width:30, height: 30)
                    .offset(x: geometry.size.width * -0.25, y:geometry.size.height * 0.45)
                    // Profile
                    Button{
                        print("Profile")
                    } label: {
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 25)
                            .colorMultiply(Color(red:75/255, green:75/255, blue: 75/255))
                    }
                    .frame(width:30, height: 30)
                    .offset(x: geometry.size.width * 0.25, y:geometry.size.height * 0.45)
                }
                // left line to parabola
                Rectangle()
                    .frame(width: 315, height:2)
                    .foregroundColor(.gray)
                    .shadow(color: .gray, radius: 5, x: 0, y:0)
                    .offset(x: geometry.size.width * -0.5, y: geometry.size.height * 0.4)
                // right line to parabola
                Rectangle()
                    .frame(width:305, height:2)
                    .foregroundColor(.gray)
                    .shadow(color:.gray, radius: 5, x: 0, y:0)
                    .offset(x: geometry.size.width * 0.49,y: geometry.size.height * 0.4)
                Path { path in
                    // parabola; midpoint = 0.5
                    // adjust focal width (width of parabola)
                    let startX: CGFloat = 0.40 * geometry.size.width
                    let endX: CGFloat = 0.60 * geometry.size.width
                    
                    // adjust 'a value
                    let controlY: CGFloat = geometry.size.height * 0.98
                    let controlX: CGFloat = geometry.size.width / 2
                    
                    // adjust starting position of ends
                    path.move(to: CGPoint(x: startX, y: geometry.size.height * 0.9))
                    path.addQuadCurve(to: CGPoint(x: endX, y: geometry.size.height * 0.9),
                                      control: CGPoint(x: controlX, y: controlY)) // adjust 'a' value
                    
                }
                
                .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.gray)
                .shadow(color: Color.gray, radius: 5, x: 0, y: 0)
                
                
            }
            
        }
    }
}




#Preview {
    ContentView()
}

/*
 ZStack {
 Path { path in
 let width = UIScreen.main.bounds.width
 let height: CGFloat = 88
 
 path.move(to: CGPoint(x: 0, y: 0))
 path.addLine(to: CGPoint(x: width, y: 0))
 path.addLine(to: CGPoint(x: width, y: height))
 path.addArc(center: CGPoint(x: width / 2, y: height), radius: 40, startAngle: .degrees(180), endAngle: .degrees(0), clockwise: true)
 path.addLine(to: CGPoint(x: 0, y: height))
 }
 .fill(Color(UIColor.systemBackground))
 .frame(height: 88)
 .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
 .overlay(
 NavigationView{
 GeometryReader{ geometry in
 HStack(alignment:.center) {
 Spacer()
 NavigationLink{
 Home()
 } label: {
 Image(systemName:"house.fill")
 .resizable()
 .frame(width:30, height: 30)
 .foregroundColor(.black)
 }
 .padding()
 NavigationLink{
 Profile()
 } label: {
 Image(systemName: "person.fill")
 .resizable()
 .frame(width: 30, height: 30)
 .foregroundColor(.black)
 Spacer()
 }
 }.frame(width: geometry.size.width, height: geometry.size.height)
 }
 }
 )
 
 Circle()
 .fill(Color(UIColor.systemBackground))
 .frame(width: 80, height: 80)
 .offset(y: -50)
 .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
 }
 }
 */
/*
 } label: {
 Image(systemName: "plus")
 .resizable()
 .frame(width: 30, height: 30)
 .foregroundColor(.white)
 }
 .padding()
 .background(Color.blue)
 .clipShape(Circle())
 .offset(y: 325)
 */
/*
 TabView (selection: $selection) {
 
 NavigationView{
 Home()
 }
 .tabItem {
 Image(systemName: "house.fill")
 }
 .tag(0)
 .navigationBarHidden(selection == 0)
 
 NavigationView{
 Build()
 }
 
 .tabItem{
 Image(systemName: "plus")
 }
 .tag(1)
 .navigationBarHidden(selection == 1)
 NavigationView{
 Profile()
 }
 .tabItem {
 Image(systemName: "person.fill")
 }
 .tag(2)
 .navigationBarHidden(selection == 2)
 */
