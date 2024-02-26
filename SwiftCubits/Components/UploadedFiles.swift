//
//  UploadedFiles.swift
//  SwiftCubits
//
//  Created by Wei (Ethan) Chen on 2/12/24.
//

import SwiftUI

struct UploadedFile: Identifiable {
    let id = UUID()
    let url: URL
    var name: String {
        url.deletingPathExtension().lastPathComponent
    }
}


