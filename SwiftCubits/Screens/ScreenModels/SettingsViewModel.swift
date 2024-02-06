//
//  SettingsViewModel.swift
//  SwiftCubits
//
//  Created by Arthur Chan on 1/27/24.
//

import Foundation

@MainActor
final class SettingsViewModel: ObservableObject{
    
    @Published private(set) var user: AuthDataResultModel? = nil // only allow modification within this file "private(set)"
    
    
    //TODO: MOVE THIS TO AN ONAPPEAR
    func loadCurrentUser() throws{
        self.user = try AuthManager.shared.getAuthUser()
    }
    
    func signOut() throws {
        try AuthManager.shared.signOut()
    }
}
