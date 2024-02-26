//
//  SettingsViewModel.swift
//  SwiftCubits
//
//  Created by Arthur Chan on 1/27/24.
//

import Foundation

@MainActor
final class ProfileModel: ObservableObject{
    
    @Published private(set) var user: DBUser? = nil // only allow modification within this file "private(set)" && Optional type w/ default nil
    
    //TODO: (HIGH) Replace location of loadCurrUser -- must determine what type of accessing rights that profile model will offer
    func loadCurrentUser() async throws{
        let authDataResult = try AuthManager.shared.getAuthUser()
        self.user = try await UserManager.shared.getUser(userId: authDataResult.uid)
    }
    
    func signOut() throws {
        try AuthManager.shared.signOut()
    }
}
