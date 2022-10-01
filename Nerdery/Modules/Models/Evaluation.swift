//
//  Evaluation.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation

struct Evaluation: Codable, Identifiable {
    let id: String
    let weight: String?
    let score: String?
    let maxScore: String?
    let feedbacks: [Feedback]
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case weight
        case score
        case maxScore
        case feedback
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .uuid)
        self.weight = try container.decode(String.self, forKey: .weight)
        self.score = try container.decode(String.self, forKey: .score)
        self.maxScore = try container.decode(String.self, forKey: .maxScore)
        self.feedbacks = try container.decode([Feedback].self, forKey: .feedback)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .uuid)
    }
}
