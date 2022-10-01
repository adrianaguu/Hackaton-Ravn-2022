//
//  Program.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation

struct Program: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let modules: [Module]
}
