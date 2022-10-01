//
//  Assignment.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation

struct Assignment: Identifiable {
    let id: String
    let challengeId: String
    let evaluationId: String
    let description: String
}

extension Assignment: Codable {
    enum CodingKeys: String, CodingKey {
        case uuid
        case challengeId
        case evaluationId
        case description
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .uuid)
        self.challengeId = try container.decode(String.self, forKey: .challengeId)
        self.evaluationId = try container.decode(String.self, forKey: .evaluationId)
        self.description = try container.decode(String.self, forKey: .description)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .uuid)
    }
}

extension Assignment {
    static let example = Assignment(id: "id1", challengeId: "challengeId", evaluationId: "evaluationId", description: "Assigment 1 Title")
    static let example1 = Assignment(id: "id2", challengeId: "challengeId", evaluationId: "evaluationId", description: "Assigment 2 Title")
    static let example2 = Assignment(id: "id3", challengeId: "challengeId", evaluationId: "evaluationId", description: "Assigment 3 Title")
}
