//
//  SearchViewModel.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 9/30/22.
//

import Combine
import Foundation

final class SearchViewModel: ObservableObject {
    private let feedbackService: FeedbackServiceType
    private let userId: String
    private var cancellables = Set<AnyCancellable>()

    @Published var searchText = ""
    @Published var isLoading = false
    @Published private(set) var feedbacks: [Feedback] = []

    var searchResults: [Feedback] {
        guard !searchText.isEmpty else { return feedbacks }
        return feedbacks.filter { $0.content.lowercased().contains(searchText.lowercased()) }
    }
    
    init(userId: String, feedbackService: FeedbackServiceType = FeedbackService()) {
        self.userId = userId
        self.feedbackService = feedbackService
        
        fetchFeedbacks()
    }
    
    func fetchFeedbacks() {
        isLoading = true
        feedbackService.getFeedbacks(userId: userId, filter: nil)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoading = false
                case .failure(_):
                    // TODO: Add alert
                    self?.isLoading = false
                }
            } receiveValue: { [weak self] feedbacks in
                self?.feedbacks = feedbacks
            }
            .store(in: &cancellables)
    }
}
