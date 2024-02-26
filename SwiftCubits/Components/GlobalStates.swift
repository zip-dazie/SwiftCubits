//
//  GlobalStates.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 2/11/24.
//

import SwiftUI
import Combine

class TabSelection: ObservableObject {
    @Published var selectedTab: Views = .home
    
    
    
    
}

enum Views{
    case home, profile, build
}
