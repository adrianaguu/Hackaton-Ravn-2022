//
//  Evaluation.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation

struct Evaluation: Codable, Identifiable {
    let id: String
    let weight: Int?
    let score: Float?
    let maxScore: Float?
    let feedbacks: [Feedback]?
}
