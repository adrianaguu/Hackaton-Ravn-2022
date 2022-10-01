//
//  Week.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation

struct Week: Codable, Identifiable {
    let id: String
    let name: String
    let isCompleted: Bool
    let themes: [Theme]
    let feebacks: [Feedback]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case isCompleted
        case themes
        case feebacks
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.isCompleted = try container.decode(Bool.self, forKey: .isCompleted)
        self.themes = try container.decode([Theme].self, forKey: .themes)
        self.feebacks = try container.decode([Feedback].self, forKey: .feebacks)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.isCompleted, forKey: .isCompleted)
        try container.encode(self.themes, forKey: .themes)
        try container.encode(self.feebacks, forKey: .feebacks)
    }
}
