//
//  Module.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation

struct Module: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let isCompleted: Bool
    let weeks: [Week]
    let evaluation: Evaluation
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case title
        case description
        case isCompleted
        case week
        case evaluation
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .uuid)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.weeks = try container.decode([Week].self, forKey: .week)
        self.evaluation = try container.decode(Evaluation.self, forKey: .evaluation)
        self.isCompleted = try container.decode(Bool.self, forKey: .isCompleted)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .uuid)
    }
}
