//
//  LoginView.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 9/30/22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationLink(destination: MainTabView()) {
            Text("Log In")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
