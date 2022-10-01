//
//  User.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import SwiftUI

enum UserRole: String, Codable {
  case NERD, MENTOR
}

struct User: Codable, Identifiable {
    let id: String
    let role: UserRole
    let image: String
    let name: String
    let technology: String
    let programId: String
    let email: String
    let modules: [Module]
    
    let program: Program
    
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case role
        case image
        case name
        case technology
        case programId
        case email
        case module
        case program
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .uuid)
        self.role = try container.decode(UserRole.self, forKey: .role)
        self.image = try container.decode(String.self, forKey: .image)
        self.name = try container.decode(String.self, forKey: .name)
        self.technology = try container.decode(String.self, forKey: .technology)
        self.programId = try container.decode(String.self, forKey: .programId)

        self.email = try container.decode(String.self, forKey: .email)
        self.modules = try container.decode([Module].self, forKey: .module)
        self.program = try container.decode(Program.self, forKey: .program)

    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .uuid)
    }
}
