//
//  Feedback.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation

struct Feedback: Codable, Identifiable {
    let id: String
    let category: String
    let content: String
    let state: String
    let type: String
    let userFrom: User
    let userTo: User
    let comments: [Comment]
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case category
        case content
        case state
        case type
        case userFrom
        case userTo
        case comment
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .uuid)
        self.category = try container.decode(String.self, forKey: .category)
        self.content = try container.decode(String.self, forKey: .content)
        self.state = try container.decode(String.self, forKey: .state)
        self.type = try container.decode(String.self, forKey: .type)
        self.userFrom = try container.decode(User.self, forKey: .userFrom)
        self.userTo = try container.decode(User.self, forKey: .userTo)
        self.comments = try container.decode([Comment].self, forKey: .comment)

    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .uuid)
    }
}
