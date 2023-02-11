//
//  SwiftEZApp.swift
//  Shared
//
//  Created by Rosalie Wessels on 2/11/23.
//

import SwiftUI
import Firebase

@main
struct SwiftEZApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView2()
        }
    }
}
