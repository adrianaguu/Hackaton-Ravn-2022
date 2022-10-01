//
//  Module.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation

struct Module: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let isCompleted: Bool
    let week: [Week]
    let evaluation: Evaluation
    let program: [Program]
}
