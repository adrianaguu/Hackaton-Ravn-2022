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
    let themes: [Theme]
    let feebacks: [Feedback]
    let challengeId: String

    let challenge: Challenge
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case moduleId
        case name
        case isCompleted
        case theme
        case feeback
        case challengeId
        case challenge
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .uuid)
        self.moduleId = try container.decode(String.self, forKey: .moduleId)
        self.name = try container.decode(String.self, forKey: .name)
        self.isCompleted = try container.decode(Bool.self, forKey: .isCompleted)
        self.themes = try container.decode([Theme].self, forKey: .theme)
        self.feebacks = try container.decode([Feedback].self, forKey: .feeback)

        self.challengeId = try container.decode(String.self, forKey: .challengeId)
        self.challenge = try container.decode(Challenge.self, forKey: .challenge)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .uuid)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.isCompleted, forKey: .isCompleted)
        try container.encode(self.themes, forKey: .theme)
        try container.encode(self.feebacks, forKey: .feeback)
    }
}
