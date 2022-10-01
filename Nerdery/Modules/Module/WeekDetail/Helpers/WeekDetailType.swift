//
//  WeekDetail.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 10/1/22.
//

import Foundation

enum WeekDetailType: CaseIterable {
    case themeList
    case challenge
    case evaluation
    
    var title: String {
        switch self {
        case .themeList:
            return "Topics"
        case .challenge:
            return "Challenge"
        case .evaluation:
            return "Feedbacks"
        }
    }
}
