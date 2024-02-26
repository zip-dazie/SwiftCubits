//
//  SwiftCubitsApp.swift
//  SwiftCubits
//
//  Created by Ethan Chen on 1/3/24.
//

import SwiftUI
import Firebase


@main
struct SwiftCubitsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var tabSelection = TabSelection()
    var body: some Scene {
        WindowGroup {
            ContentView(tabSelection: tabSelection)
            .environmentObject(UploadedFilesModel()) // For local Caching
        }
    }
}

//MARK: No idea what this does -- makes things work
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

/* persisting data for later backend handling
 Uploaded file history
 User information
 Generated Instructions
 */
