//
//  Challenge.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation

struct Challenge: Identifiable {
    let id: String
    let assignments: [Assignment]
    let evaluationId: String
    let evaluation: Evaluation
}

extension Challenge: Codable {
    enum CodingKeys: String, CodingKey {
        case uuid
        case assignments
        case evaluationId
        case evaluation
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .uuid)
        self.assignments = try container.decode([Assignment].self, forKey: .assignments)
        self.evaluationId = try container.decode(String.self, forKey: .evaluationId)
        self.evaluation = try container.decode(Evaluation.self, forKey: .evaluation)

    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .uuid)
    }
}
