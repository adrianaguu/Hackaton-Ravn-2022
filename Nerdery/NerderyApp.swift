//
//  NerderyApp.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 9/30/22.
//

import SwiftUI

@main
struct NerderyApp: App {
    @StateObject var authentication = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            if authentication.isValidated {
                MainTabView()
                    .environmentObject(authentication)
            } else {
                LoginView()
                    .environmentObject(authentication)
            }
        }
    }
}
