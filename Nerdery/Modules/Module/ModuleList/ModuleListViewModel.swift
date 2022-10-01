//
//  ModuleListViewModel.swift
//  Nerdery
//
//  Created by Adriana Gutierrez on 9/30/22.
//

import Foundation
import Combine

class ModuleListViewModel: ObservableObject {
    @Published var modules: [Module] = [.example1, .example2]
    @Published var isLoading = false
    
    let userId: String
    let programId: String
    
    private let moduleService: ModuleServiceType
    private var cancellables = Set<AnyCancellable>()
    
    init(userId: String, programId: String, moduleService: ModuleServiceType = ModuleService()) {
        self.userId = userId
        self.programId = programId
        self.moduleService = moduleService
        
        fetchModules()
    }
    
    func fetchModules() {
        isLoading = true
        moduleService.getModules(userId: userId)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoading = false
                case .failure(_):
                    // TODO: Add alert
                    self?.isLoading = false
                }
            } receiveValue: { [weak self] modules in
                self?.modules = modules
            }
            .store(in: &cancellables)

    }
}
