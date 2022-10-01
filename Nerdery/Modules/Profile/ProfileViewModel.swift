//
//  ProfileViewModel.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 9/30/22.
//

import Foundation
import SwiftUI
import Combine

final class ProfileViewModel: ObservableObject {
    @Published var user: User = .example
    @Published var isLoading = false
    
    let userService: UserServiceType
    
    private var cancellables = Set<AnyCancellable>()
    
    init(userId: String, userService: UserServiceType = UserService()) {
        self.userService = userService
        
        fetchUser(userId: userId)
    }
    
    private func fetchUser(userId: String) {
        isLoading = true
        userService.getUser(id: userId)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoading = false
                case .failure(_):
                    // TODO: Show alert
                    self?.isLoading = false
                }
            } receiveValue: { [weak self] user in
                self?.user = user
            }
            .store(in: &cancellables)

    }
}
