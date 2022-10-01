//
//  ModuleDetailViewModel.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 10/1/22.
//

import Foundation
import Combine

final class ModuleDetailViewModel: ObservableObject {
    @Published var displayedDetail: ModuleDetailType
    @Published var weeks: [Week] = []
    @Published var isLoadingWeeks = false
    @Published var feedbacks: [Feedback] = []
    @Published var isLoadingFeedbacks = false
    
    let moduleId: String
    private let moduleService: ModuleServiceType
    private var cancellables = Set<AnyCancellable>()
    
    init(moduleId: String, displayedDetail: ModuleDetailType = .weekList, moduleService: ModuleServiceType = ModuleService()) {
        self.displayedDetail = displayedDetail
        self.moduleId = moduleId
        self.moduleService = moduleService
        
        fetchWeeks()
        fetchFeedbacks()
    }
    
    func fetchWeeks() {
        isLoadingWeeks = true
        moduleService.getWeeks(moduleId: moduleId)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoadingWeeks = false
                case .failure(_):
                    // TODO: Show alert message
                    self?.isLoadingWeeks = false
                }
            } receiveValue: { [weak self] weeks in
                self?.weeks = weeks
            }
            .store(in: &cancellables)

    }
    
    func fetchFeedbacks() {
        isLoadingFeedbacks = true
        moduleService.getModuleFeedbacks(moduleId: moduleId)
            .sink { [weak self] completion in
                switch completion {
                    
                case .finished:
                    self?.isLoadingFeedbacks = false
                case .failure(_):
                    // TODO: Show alert message
                    self?.isLoadingFeedbacks = false
                }
            } receiveValue: { [weak self] feedbacks in
                self?.feedbacks = feedbacks
            }
            .store(in: &cancellables)

    }
}
