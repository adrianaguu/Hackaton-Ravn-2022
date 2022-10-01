//
//  Challenge.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation

struct Challenge: Codable, Identifiable {
    let id: String
    let assignments: [Assignment]
    let evaluation: Evaluation
}
