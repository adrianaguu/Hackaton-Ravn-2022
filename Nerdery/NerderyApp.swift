//
//  NerderyApp.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 9/30/22.
//

import SwiftUI
import AppCenter
import AppCenterDistribute

@main
struct NerderyApp: App {
    @StateObject var authentication = AuthenticationViewModel()
    
    init() {
        Distribute.disableAutomaticCheckForUpdate()
        AppCenter.start(withAppSecret: "81f4ac45-a1a4-43ab-ba12-82b6eaba7922", services: [Distribute.self])
    }
    
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
