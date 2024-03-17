//
//  ModelView.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 3/16/24.
//

import SwiftUI

struct ModelPlaceholder: Identifiable {
    let id = UUID()
    let label: String
    var modelURL: String?
}
//TODO: to Insert a 3D model, use the url in the PARENT(not here) struct declarations, quantity is hard-coded
struct UnitViewer: View {
    let placeholders = [
        ModelPlaceholder(label: "6x", modelURL: nil),
        ModelPlaceholder(label: "2x", modelURL: nil),
        ModelPlaceholder(label: "6x", modelURL: nil),
        ModelPlaceholder(label: "4x", modelURL: nil),
        ModelPlaceholder(label: "4x", modelURL: nil),
        ModelPlaceholder(label: "6x", modelURL: nil)
    ]

    var body: some View {
       
            UnitView(modelPlaceholders: placeholders)
        }
    }


struct ModelPlaceholderView: View {
    var placeholder: ModelPlaceholder
    @State private var showModel = false

    var body: some View {
        Button(action: {
            showModel = true
        }) {
            ZStack {
                //TODO: color is for UI design, change to clear after rendering --> Color.clear
                Color.gray
                    .frame(width: 70, height: 70)
                    .cornerRadius(10)
            }
            .overlay(
                Text(placeholder.label)
                    .foregroundColor(Color.black.opacity(0.7))
                          .font(.system(size: 18))
                          .padding(5),
                alignment: .topLeading
            )
        }
        // TODO: modify this when rendering the model
        .sheet(isPresented: $showModel) {
            if let modelURL = placeholder.modelURL {
                Text("Model \(modelURL)")
            } else {
                Text("No Model")
            }
        }
    }
}

struct UnitView: View {
    var modelPlaceholders: [ModelPlaceholder]
    let itemWidth: CGFloat = 70
    let spacing: CGFloat = 7.5
    let gridPadding: CGFloat = 8
    let horizontalPadding: CGFloat = 20

    private var columns: [GridItem] {
        let availableWidth = UIScreen.main.bounds.width - (2 * horizontalPadding) - (spacing * 3)
        let numberOfItemsInRow = Int(availableWidth / (itemWidth + spacing))
        return Array(repeating: .init(.fixed(itemWidth)), count: max(numberOfItemsInRow, 1))
    }

    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 0) {
                Spacer()
                Spacer()
                Text("Units")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                Spacer()
            }
        }
        LazyVGrid(columns: columns, alignment: .center, spacing: spacing) {
            ForEach(modelPlaceholders) { modelPlaceholder in
                ModelPlaceholderView(placeholder: modelPlaceholder)
                    .frame(width: itemWidth, height: itemWidth)
            }
        }
        .padding([.horizontal, .vertical], gridPadding)
        .background(Color.modelBackground)
        .cornerRadius(10)
        .padding(.horizontal, 20)
    }
}
#Preview {
    UnitViewer()
}
