//
//  User.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import SwiftUI

struct User: Codable, Identifiable {
    let id: String
    //    let role
    let image: String
    let name: String
    let technology: Program
    let email: String
    let modules: [Module]

}
