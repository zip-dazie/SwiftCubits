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
        NavigationStack{
            
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
                        //TODO: link to selectFile
                        NavigationLink(destination: SelectFile()){
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
                    Section {
                        Text("Uploads")
                            .bold()
                        
                        NavigationLink(destination: PreInstructions(preInstructionsView: .constant(true))){
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
                    }    .padding(.leading, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
            }
            .padding(.top)
            Spacer(minLength: 55)
        }.navigationBarBackButtonHidden(true)

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
