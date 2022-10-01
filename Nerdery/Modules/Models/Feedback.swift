//
//  Feedback.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation

struct Feedback: Identifiable {
    let id: String
    let category: String
    let content: String
    let state: String
    let type: String
    let evaluationId: String
}

extension Feedback: Codable {
    enum CodingKeys: String, CodingKey {
        case uuid
        case category
        case content
        case state
        case type
        case evaluationId
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .uuid)
        self.category = try container.decode(String.self, forKey: .category)
        self.content = try container.decode(String.self, forKey: .content)
        self.state = try container.decode(String.self, forKey: .state)
        self.type = try container.decode(String.self, forKey: .type)
        self.evaluationId = try container.decode(String.self, forKey: .evaluationId)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .uuid)
    }
}

extension Feedback {
    static let example = Feedback(id: "id1", category: "Category", content: "Feedback goes here", state: "Checked", type: "To Improve", evaluationId: "evaluationId")
    static let example1 = Feedback(id: "id2", category: "Category", content: "Feedback goes here", state: "UnChecked", type: "Good", evaluationId: "evaluationId")
}
