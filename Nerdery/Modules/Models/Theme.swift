//
//  Theme.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation

struct Theme: Codable, Identifiable {
    let id: String
    let name: String
    let evaluation: Evaluation
    let url: String
    let weekId: String
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case name
        case evaluation
        case link
        case weekId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .uuid)
        self.name = try container.decode(String.self, forKey: .name)
        self.evaluation = try container.decode(Evaluation.self, forKey: .evaluation)
        self.url = try container.decode(String.self, forKey: .link)
        self.weekId = try container.decode(String.self, forKey: .weekId)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .uuid)
    }
}
