//
//  NavButton.swift
//  SwiftCubits
//  Created by Wei (Ethan) Chen on 3/11/24.

import SwiftUI

struct NavButton<Destination: View>: View {
    var destination: Destination
    var icon: String
    var linkText: String? = nil

    var body: some View {
        NavigationLink(destination: destination) {
            HStack(spacing: linkText != nil ? 10 : 0) {
                if let text = linkText {
                    Text(text)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                }
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)

            }
            .padding(.horizontal, linkText != nil ? 10 : 5)
            .padding(.vertical, 5)
            .background(RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.customPurple)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5))
        }
    }
}
#Preview {
    NavButton(destination:Home(), icon: "rightArrow", linkText: "Next")
}

