//
//  Build.swift
//  SwiftCubits
//  Created by Wei Chen on 1/5/24.
//

import SwiftUI
import SceneKit
import UniformTypeIdentifiers

class UploadedFilesModel: ObservableObject {
    @Published var files: [URL] = []
}

struct FileDetailView: View {
    var fileURL: URL
    
    var body: some View {
        Text("Detail View for \(fileURL.lastPathComponent)")
            .navigationBarTitle(Text(fileURL.lastPathComponent), displayMode: .inline)
    }
}
struct Build: View {
    @State private var importing = false
    @State private var preInstructionsView = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Upload your File")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                    .padding(.leading, 20)
                
                Section {
                    Text("File should be OBJ, STL, or AMF")
                        .opacity(0.5)
                        .padding(.leading, 20)
                }
                
                VStack {
                    Spacer()
                    Button(action: { importing = true }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .font(.system(size: 50, weight: .heavy))
                            .foregroundColor(.white)
                    }
                    .padding(8)
                    .background(Color.dark)
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                    
                    Text("Drag & Drop or Choose file\n Max file size: 10 MB")
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .opacity(0.5)
                    Spacer()
                }
                .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [6]))
                        .foregroundColor(.gray)
                )
                .frame(height: 250)
                .padding(25)
                
                
                /*
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
                 */
                Section {
                    Text("Uploads")
                        .bold()
                    Button(action: {
                        preInstructionsView = true
                   
                    }) {
                        HStack {
                            Image("demoShape")
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
                    .padding(.vertical, 10.0)
                        .font(.title)
                        .fontWeight(.bold)
                        .fullScreenCover(isPresented: $preInstructionsView, content:{
                            NavigationView{
                                PreInstructions(preInstructionsView: $preInstructionsView)
                            }
                        })
                    
                }                    .padding(.leading, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.top)
        
        Spacer(minLength: 55)
    }
    
}

struct UploadedFileRow: View {
    var url: URL
    
    var body: some View {
        HStack {
            Image("uploadicon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 65.0)
                .padding([.top, .leading, .bottom])
            
            VStack(alignment: .leading) {
                Text(url.lastPathComponent)
                    .bold()
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                HStack {
                    Text("2.3 MB")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    Text("Upload Complete")
                        .font(.system(size: 14))
                        .foregroundColor(.green)
                }
            }
            
            Spacer()
            
            Button(action: {
                print("Nested Button Tapped")
            }) {
                Image("verticaldots")
                    .frame(width: 24, height: 24)
                    .padding(.trailing)
            }
        }
        .frame(width: 342, height: 65)
        .background(Color("CustomGray"))
        .cornerRadius(10)
    }
}
#Preview{
    Build()
}
