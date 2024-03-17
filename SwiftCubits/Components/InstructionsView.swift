//
//  InstructionsView.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 3/16/24.
//

import SwiftUI

struct InstructionsView: View {
    let modelURLs: [URL]
    @State private var showStep = false
    @State private var selectedURL: URL?

    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 0) {
                Spacer()
                Text("Instructions")
                    .font(.system(size: 18)) 
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.leading, 10)
                Spacer()
            }
        }
        ScrollView {
            VStack(spacing: 0) {
                ForEach(Array(modelURLs.enumerated()), id: \.offset) { index, url in
                    VStack {
                        HStack {
                            Text("\(index + 1).")
                                .font(.system(size: 18))
                                .padding(.horizontal)
                            Spacer()
                        }
                        .background(Color.white)
                        .offset(y: 22)
                        .zIndex(1)
                        
                        Button(action: {
                            selectedURL = url
                            showStep = true
                        }) {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 2)
                            //TODO: make clear when done with importing
                                .foregroundColor(.purple)
                                .frame(width: 310, height: 210)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical, 10)

                    if index < modelURLs.count - 1 {
                        Rectangle()
                            .fill(Color.gray.opacity(0.20))
                            .frame(height: 3)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 25)
                    }
                }
            }
        }
        .sheet(isPresented: $showStep) {
            if let urlToShow = selectedURL {
                Text("Displaying model from URL: \(urlToShow.absoluteString)")
            }
        }
    }
}

#Preview {
    let testURLStrings = ["Asteroid_2-1", "invalidURL", "Asteroid_5-4"]
    let modelURLs: [URL] = testURLStrings.map { urlString in
        if let url = URL(string: urlString) {
            return url
        } else {
            return URL(string: "Unable to load model")!
        }
    }
    return InstructionsView(modelURLs: modelURLs)
}
