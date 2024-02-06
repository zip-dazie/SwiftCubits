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

struct Build: View{
    @State private var importing = false
    @EnvironmentObject var uploadedFilesModel: UploadedFilesModel
    var body: some View{
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
                
                Text("Drag & Drop or Choose file\n Max file size: 10mb")
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
            ).frame(height:250)
                .padding(25)
            
            
                .fileImporter(
                    isPresented: $importing,
                    allowedContentTypes: [UTType.content],
                    allowsMultipleSelection: false
                ) { result in
                    switch result {
                    case .success(let urls):
                        // Update the ObservableObject's data
                        uploadedFilesModel.files.append(contentsOf: urls)
                    case .failure(let error):
                        print("Error selecting file: \(error.localizedDescription)")
                    }
                }
                .padding(.bottom, 10)
            
            Section {
                Text("Uploads")
                    .font(.title)
                    .fontWeight(.bold)
                
                Button(action: {
                    // Action for the main button
                    print("Main Button Tapped")
                }) {
                    HStack {
                        Image("uploadicon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 65.0)
                            .padding([.top, .leading, .bottom])
                        
                        VStack {
                            HStack {
                                Text("Mountain")
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
                
                .padding(.vertical, 10.0)
                
               
                
                
                // Display the list of uploaded files using the ObservableObject's data
                //ForEach(uploadedFilesModel.files, id: \.self) { url in
                //Text(url.lastPathComponent)
                //.padding(.vertical, 2)
                // }
                //}
                
                //.frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }.padding(.top)
                .padding(.leading, 20)

            NavigationLink {
                Instructions()
            } label: {
                Image(systemName: "cube.transparent")
                    .foregroundColor(Color(.customGray))
            }
            .padding(.bottom, 55)
            .padding(.leading, 20)
            .imageScale(.large)
            .font(.system(size: 25))
            
        }
    }
}


/*
 
 
 struct Build: View {
 //@State var scene: SCNScene? = .init(named: "GOAT.usdz")
 @State private var importing = false
 @EnvironmentObject var uploadedFilesModel: UploadedFilesModel // Use EnvironmentObject
 
 var body: some View {
 VStack(alignment: .leading, spacing: 20) {
 Text("Upload Your File")
 .font(.title)
 .fontWeight(.bold)
 .padding(.top)
 
 Section {
 Text("File should be OBJ, STL, or AMF")
 .opacity(0.5)
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
 
 Text("Drag & Drop or Choose file\n Max file size: 10mb")
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
 ).frame(height:250)
 
 .fileImporter(
 isPresented: $importing,
 allowedContentTypes: [UTType.content],
 allowsMultipleSelection: false
 ) { result in
 switch result {
 case .success(let urls):
 // Update the ObservableObject's data
 uploadedFilesModel.files.append(contentsOf: urls)
 case .failure(let error):
 print("Error selecting file: \(error.localizedDescription)")
 }
 }
 .padding(.bottom, 10)
 
 Section {
 Text("Uploads")
 .font(.title)
 .fontWeight(.bold)
 .padding(.top)
 
 // Display the list of uploaded files using the ObservableObject's data
 ForEach(uploadedFilesModel.files, id: \.self) { url in
 Text(url.lastPathComponent)
 .padding(.vertical, 2)
 }
 }
 
 .frame(maxWidth: .infinity, alignment: .leading)
 Spacer()
 }
 .padding()
 }
 }
 */
#Preview {
    Build()
}
