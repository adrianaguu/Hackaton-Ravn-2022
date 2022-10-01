//
//  Module.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation

struct Module: Identifiable {
    let id: String
    let title: String
    let description: String
    let isCompleted: Bool
    let evaluationId: String
}

extension Module: Codable {
    enum CodingKeys: String, CodingKey {
        case uuid
        case title
        case description
        case isCompleted
        case evaluationId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .uuid)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.evaluationId = try container.decode(String.self, forKey: .evaluationId)
        self.isCompleted = try container.decode(Bool.self, forKey: .isCompleted)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .uuid)
    }
}

extension Module {
    static let example1 = Module(id: "id1", title: "Module 1", description: "Module Topic Name", isCompleted: true, evaluationId: "evaluationId")
    static let example2 = Module(id: "id2", title: "Module 2", description: "Module Topic Name", isCompleted: false, evaluationId: "evaluationId")
}
