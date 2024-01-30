//
//  AuthDataResultModel.swift
//  SwiftCubits
//
//  Created by Arthur Chan on 1/27/24.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel{ // local copy of authentication configured to store in firebase SDK
    let uid: String
    let email: String? //optional string
    let photoURL: String? //optional string
    
    init(user: User){ //user sourced from FB sdk
        self.uid = user.uid
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
    }
}
