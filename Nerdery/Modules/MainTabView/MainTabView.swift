//
//  ContentView.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 9/30/22.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var authentication: AuthenticationViewModel
    
    var body: some View {
        TabView {
            Profile(viewModel: ProfileViewModel(userId: authentication.userId))
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }

            ModuleList()
                .tabItem {
                    Label("Modules", systemImage: "tray.and.arrow.down.fill")
                }

            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
