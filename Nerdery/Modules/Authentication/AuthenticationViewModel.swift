//
//  AuthenticationViewModel.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import SwiftUI

class AuthenticationViewModel: ObservableObject {
    @Published var isValidated = false
    
    let userId: String = "f18b2a05-bcc9-4732-9d7a-370356ac92b1"
    let programId: String = "programId"
    
    func updateValidation(success: Bool) {
        withAnimation {
            isValidated = success
        }
    }
}
