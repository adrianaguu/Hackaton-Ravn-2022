//
//  ModuleService.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation
import Combine

protocol ModuleServiceType {
    func getModules(userId: String, programId: String) -> AnyPublisher<User, Error>
    func getModuleFeedbacks(moduleId: String) -> AnyPublisher<[Feedback], Error>
    func getWeeks(moduleId: String) -> AnyPublisher<[Week], Error>
    func getThemes(moduleId: String, weekId: String) -> AnyPublisher<[Theme], Error>
    func getChallenge(moduleId: String, weekId: String) -> AnyPublisher<Challenge, Error>
    func getWeekFeedbacks(moduleId: String, weekId: String) -> AnyPublisher<[Feedback], Error>
}

struct ModuleService: ModuleServiceType {
    let session: URLSessionType
    let decoder: JSONDecoder
    
    init(session: URLSessionType = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    

    func getModules(userId: String, programId: String) -> AnyPublisher<User, Error> {
        session.request(
            urlString: ConfigService.baseURL + "programs/\(programId)/modules/\(userId)/",
            requestType: .get
        )
        .decode(type: User.self, decoder: decoder)
        .eraseToAnyPublisher()
    }
    
    func getFeedbacks(moduleId: String) -> AnyPublisher<[Feedback], Error> {
        session.request(
            urlString: ConfigService.baseURL + "modules/\(moduleId)/feedbacks",
            requestType: .get
        )
        .decode(type: [Feedback].self, decoder: decoder)
        .eraseToAnyPublisher()
    }
    
    func getWeeks(moduleId: String) -> AnyPublisher<[Week], Error> {
        session.request(
            urlString: ConfigService.baseURL + "modules/\(moduleId)/weeks",
            requestType: .get
        )
        .decode(type: [Week].self, decoder: decoder)
        .eraseToAnyPublisher()
    }
    
    func getModuleFeedbacks(moduleId: String) -> AnyPublisher<[Feedback], Error> {
        session.request(
            urlString: ConfigService.baseURL + "modules/\(moduleId)/feedbacks",
            requestType: .get
        )
        .decode(type: [Feedback].self, decoder: decoder)
        .eraseToAnyPublisher()
    }
    
    func getThemes(moduleId: String, weekId: String) -> AnyPublisher<[Theme], Error> {
        session.request(
            urlString: ConfigService.baseURL + "modules/\(moduleId)/weeks/\(weekId)/themes",
            requestType: .get
        )
        .decode(type: [Theme].self, decoder: decoder)
        .eraseToAnyPublisher()
    }
    
    func getChallenge(moduleId: String, weekId: String) -> AnyPublisher<Challenge, Error> {
        session.request(
            urlString: ConfigService.baseURL + "modules/\(moduleId)/weeks/\(weekId)/challenge",
            requestType: .get
        )
        .decode(type: Challenge.self, decoder: decoder)
        .eraseToAnyPublisher()
    }
    
    func getWeekFeedbacks(moduleId: String, weekId: String) -> AnyPublisher<[Feedback], Error> {
        session.request(
            urlString: ConfigService.baseURL + "modules/\(moduleId)/weeks/\(weekId)/feedbacks",
            requestType: .get
        )
        .decode(type: [Feedback].self, decoder: decoder)
        .eraseToAnyPublisher()
    }

}