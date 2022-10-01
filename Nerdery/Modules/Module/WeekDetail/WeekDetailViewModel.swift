//
//  WeekDetail.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 9/30/22.
//

import Foundation

final class WeekDetailViewModel: ObservableObject {
    @Published var displayedDetail: WeekDetailType
    
    init(displayedDetail: WeekDetailType = .themeList) {
        self.displayedDetail = displayedDetail
    }
}
