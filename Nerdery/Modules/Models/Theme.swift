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
    let evaluationId: String
    let url: String
    let weekId: String
}

extension Theme {
    enum CodingKeys: String, CodingKey {
        case uuid
        case name
        case evaluationId
        case link
        case weekId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .uuid)
        self.name = try container.decode(String.self, forKey: .name)
        self.evaluationId = try container.decode(String.self, forKey: .evaluationId)
        self.url = try container.decode(String.self, forKey: .link)
        self.weekId = try container.decode(String.self, forKey: .weekId)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .uuid)
    }
}

extension Theme {
    static let example = Theme(id: "id1", name: "Topic 1 Title", evaluationId: "evaluationId", url: "someURL", weekId: "weekId")
    static let example1 = Theme(id: "id2", name: "Topic 2 Title", evaluationId: "evaluationId", url: "someURL", weekId: "weekId")
    static let example2 = Theme(id: "id3", name: "Topic 3 Title", evaluationId: "evaluationId", url: "someURL", weekId: "weekId")
}
