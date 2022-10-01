//
//  Comment.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation

struct Comment: Codable, Identifiable {
    let id: String
    let feedbackId: String
    
    let feedback: Feedback
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case feedbackId
        case feedback
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .uuid)
        self.feedbackId = try container.decode(String.self, forKey: .feedbackId)
        self.feedback = try container.decode(Feedback.self, forKey: .feedback)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .uuid)
    }
}
