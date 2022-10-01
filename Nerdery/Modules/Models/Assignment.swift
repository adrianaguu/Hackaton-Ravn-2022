//
//  Assignment.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation

struct Assignment: Codable, Identifiable {
    let id: String
    let challengeId: String
    let evaluationId: String
    let description: String
    
    let evaluation: Evaluation
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case challengeId
        case evaluationId
        case description
        case evaluation
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .uuid)
        self.challengeId = try container.decode(String.self, forKey: .challengeId)
        self.evaluationId = try container.decode(String.self, forKey: .evaluationId)
        self.description = try container.decode(String.self, forKey: .description)
        self.evaluation = try container.decode(Evaluation.self, forKey: .evaluation)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .uuid)
    }
}
