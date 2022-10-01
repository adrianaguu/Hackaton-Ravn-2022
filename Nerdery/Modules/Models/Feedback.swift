//
//  Feedback.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation

struct Feedback: Codable, Identifiable {
    let id: String
//    let category: Category
    let content: String
//    let state: FeedbackState
//    let type: FeedbackType
    let userFrom: User
    let userTo: User
//    let comments: Comment[]
}
