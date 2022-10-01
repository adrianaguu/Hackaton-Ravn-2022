//
//  Program.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation

struct Program: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let modules: [Module]
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case title
        case description
        case module
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .uuid)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.modules = try container.decode([Module].self, forKey: .module)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .uuid)
    }
}
