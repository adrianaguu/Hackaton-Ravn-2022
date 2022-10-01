//
//  ModuleDetailType.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 10/1/22.
//

import Foundation

enum ModuleDetailType: CaseIterable {
    case weekList
    case evaluation
    
    var title: String {
        switch self {
        case .weekList:
            return "Weeks"
        case .evaluation:
            return "Evaluation"
        }
    }
}
