//
//  ModuleDetailViewModel.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 10/1/22.
//

import Foundation

final class ModuleDetailViewModel: ObservableObject {
    @Published var displayedDetail: ModuleDetailType
    
    init(displayedDetail: ModuleDetailType = .weekList) {
        self.displayedDetail = displayedDetail
    }
}
