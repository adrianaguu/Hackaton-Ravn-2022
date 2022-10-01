//
//  AuthenticationViewModel.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import SwiftUI

class AuthenticationViewModel: ObservableObject {
    @Published var isValidated = false
    
    let userId: String = "userID"
    
    func updateValidation(success: Bool) {
        withAnimation {
            isValidated = success
        }
    }
}