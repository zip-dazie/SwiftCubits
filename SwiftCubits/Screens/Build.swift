//
//  Build.swift
//  SwiftCubits
//  Created by Wei Chen on 1/5/24.
//

import SwiftUI
import SceneKit
import UniformTypeIdentifiers
struct Build: View {
    @State var scene: SCNScene? = .init(named: "GOAT.usdz")
    @State private var importing = false
    var body: some View {
        VStack(alignment: .leading, spacing: 20) { // Align content to the leading edge
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
                Button(action: {
                    importing = true}
                ){
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .font(.system(size:50, weight: .heavy))
                        .foregroundColor(.white)
                }
                .padding(8)
                .background(Color.dark)
                .clipShape(Circle())
                .frame(width: 50, height: 50)
                
                Text("Drag & Drop or Choose file\n Max file size: 10mb")
                    .multilineTextAlignment(.center)                     .frame(maxWidth: .infinity)
                    .padding()
                    .opacity(0.5)
                Spacer()
            }
            .background(
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [6]))
                    .foregroundColor(.gray)
            )
            // importer code from CHATGPT -------------------------------------
            .fileImporter(
                isPresented: $importing,
                allowedContentTypes: [UTType.content],
                allowsMultipleSelection: false
            ) { result in
                // Handle the result of the file importer
                switch result {
                case .success(let urls):
                    // Use the selected file URLs
                    let _ = urls.map { print($0) }
                case .failure(let error):
                    // Handle errors
                    print("Error selecting file: \(error.localizedDescription)")
                }
            }// Importer code from CHATGPT-------------------------------------
            .padding(.bottom, 10)
            
            Section{
                Text("Uploads")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                Rectangle()
                    .foregroundColor(.clear)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    Build()
}
