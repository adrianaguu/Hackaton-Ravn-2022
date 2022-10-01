//
//  Theme.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation

struct Theme: Codable, Identifiable {
    let id: String
    let name: String
    let evaluation: String
    let url: String
}