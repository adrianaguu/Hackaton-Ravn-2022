//
//  WeekDetail.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 9/30/22.
//

import Foundation
import Combine

final class WeekDetailViewModel: ObservableObject {
    @Published var displayedDetail: WeekDetailType
    @Published var topics: [Theme] = [.example, .example1, .example2]
    @Published var assignments: [Assignment] = [.example, .example1, .example2]
    @Published var feedbacks: [Feedback] = [.example, .example1]
    @Published var isLoadingTopics = false
    @Published var isLoadingChallenge = false
    @Published var isLoadingFeedbacks = false
    
    let moduleId: String
    let weekId: String
    let weekTitle: String
    let isCompleted: Bool

    private let moduleService: ModuleServiceType
    private var cancellables = Set<AnyCancellable>()
    
    init(moduleId: String, weekId: String, weekTitle: String, isCompleted: Bool, displayedDetail: WeekDetailType = .themeList, moduleService: ModuleServiceType = ModuleService()) {
        self.displayedDetail = displayedDetail
        self.moduleService = moduleService
        self.moduleId = moduleId
        self.weekId = weekId
        self.weekTitle = weekTitle
        self.isCompleted = isCompleted
    }
    
    func fetchTopics() {
        isLoadingTopics = true
        moduleService.getThemes(moduleId: moduleId, weekId: weekId)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoadingTopics = false
                case .failure(_):
                    // TODO: Show alert message
                    self?.isLoadingTopics = false
                }
            } receiveValue: { [weak self] topics in
                self?.topics = topics
            }
            .store(in: &cancellables)
            
    }
    
    func fetchChallenge() {
        isLoadingChallenge = true
        moduleService.getChallenge(moduleId: moduleId, weekId: weekId)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoadingChallenge = false
                case .failure(_):
                    // TODO: Show alert message
                    self?.isLoadingChallenge = false
                }
            } receiveValue: { [weak self] assignments in
                self?.assignments = assignments
            }
            .store(in: &cancellables)
            
    }
    
    func fetchFeedbacks() {
        isLoadingFeedbacks = true
        moduleService.getWeekFeedbacks(moduleId: moduleId, weekId: weekId)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoadingTopics = false
                case .failure(_):
                    // TODO: Show alert message
                    self?.isLoadingTopics = false
                }
            } receiveValue: { [weak self] feedbacks in
                self?.feedbacks = feedbacks
            }
            .store(in: &cancellables)
            
    }
}
