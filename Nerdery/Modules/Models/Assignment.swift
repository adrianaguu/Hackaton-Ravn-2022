//
//  Assignment.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation

struct Assignment: Codable, Identifiable {
    let id: String
    let description: String
    let evaluation: Evaluation
}
