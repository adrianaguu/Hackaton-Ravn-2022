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
            return "Themes"
        case .challenge:
            return "Challenge"
        case .evaluation:
            return "Evaluation"
        }
    }
}
