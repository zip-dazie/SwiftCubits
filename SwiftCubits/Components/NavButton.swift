//
//  NavButton.swift
//  SwiftCubits
//  Created by Wei (Ethan) Chen on 3/11/24.

import SwiftUI

struct NavButton<Destination: View>: View {
    enum Orientation {
        case forward, backward
    }

    var destination: Destination
    var icon: String
    var linkText: String? = nil
    var orientation: Orientation = .forward

    var backgroundColor: Color {
        switch linkText {
        case "Back":
            return Color.gray
        case "Next":
            return Color.customPurple
        default:
            return .clear
        }
    }

    var body: some View {
        NavigationLink(destination: destination) {
            HStack(spacing: linkText != nil ? 10 : 0) {
                if orientation == .backward {
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                }

                if let text = linkText, orientation == .forward {
                    Text(text)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                }

                if orientation == .forward {
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                } else if let text = linkText {
                    Text(text)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                }
            }
            .padding(.horizontal, linkText != nil ? 10 : 5)
            .padding(.vertical, 5)
            .background(RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(backgroundColor)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5))
        }
    }
}
#Preview {
    NavButton(destination:Home(), icon: "leftArrow", linkText: "Back", orientation:.backward)
}
