//
//  LoginView.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 9/30/22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authentication: AuthenticationViewModel
    
    var body: some View {
        Button {
            authentication.updateValidation(success: true)
        } label: {
            Text("Log In")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
