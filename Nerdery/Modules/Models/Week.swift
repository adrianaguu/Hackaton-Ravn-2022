//
//  Week.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation

struct Week: Codable, Identifiable {
    let id: String
    let moduleId: String
    let name: String
    let isCompleted: Bool
    let challengeId: String
}

extension Week {
    enum CodingKeys: String, CodingKey {
        case uuid
        case moduleId
        case name
        case isCompleted
        case challengeId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .uuid)
        self.moduleId = try container.decode(String.self, forKey: .moduleId)
        self.name = try container.decode(String.self, forKey: .name)
        self.isCompleted = try container.decode(Bool.self, forKey: .isCompleted)
        self.challengeId = try container.decode(String.self, forKey: .challengeId)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .uuid)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.isCompleted, forKey: .isCompleted)
    }
}

extension Week {
    static let example = Week(id: "id1", moduleId: "moduleId1", name: "Week 1", isCompleted: true, challengeId: "challengeId")
    static let example1 = Week(id: "id2", moduleId: "moduleId2", name: "Week 2", isCompleted: false, challengeId: "challengeId")
}
