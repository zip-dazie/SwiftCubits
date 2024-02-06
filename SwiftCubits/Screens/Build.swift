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
                    .padding(.top)
                
                
                
                
                // Display the list of uploaded files using the ObservableObject's data
                //ForEach(uploadedFilesModel.files, id: \.self) { url in
                //Text(url.lastPathComponent)
                //.padding(.vertical, 2)
                // }
                //}
                
                //.frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            .padding()
            
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
