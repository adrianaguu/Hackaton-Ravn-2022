//
//  UserService.swift
//  Nerdery
//
//  Created by Ruben Torres on 9/30/22.
//

import Foundation
import Combine

protocol UserServiceType {
    func getUser(id: String) -> AnyPublisher<User, Error>
}

struct UserService: UserServiceType {
    let session: URLSessionType
    let decoder: JSONDecoder
    
    init(session: URLSessionType = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    
    func getUser(id: String) -> AnyPublisher<User, Error> {
        session.request(
            urlString: ConfigService.baseURL + "users/\(id)",
            requestType: .get
        )
        .decode(type: User.self, decoder: decoder)
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
