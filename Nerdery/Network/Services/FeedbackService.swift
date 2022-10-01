//
//  FeedbackService.swift
//  Nerdery
//
//  Created by Ruben Torres on 10/1/22.
//

import Foundation
import Combine

enum FeedbackFilter: String {
    case module, week, mentor, challenge, themes, all
}

protocol FeedbackServiceType {
    func getFeedbacks(userId: String, filter: FeedbackFilter?) -> AnyPublisher<[Feedback], Error>
}

struct FeedbackService: FeedbackServiceType {
    let session: URLSessionType
    let decoder: JSONDecoder
    
    init(session: URLSessionType = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    
    func getFeedbacks(userId: String, filter: FeedbackFilter? = nil) -> AnyPublisher<[Feedback], Error> {
        session.request(
            urlString: ConfigService.baseURL + "users/\(userId)/feedbacks/filterAll",
            requestType: .get
        )
        .decode(type: [Feedback].self, decoder: decoder)
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
}
