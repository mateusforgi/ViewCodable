//
//  NetworkManager.swift
//  SwiftUIServerDrivenUI
//
//  Created by Mateus Forgiarini on 10/3/20.
//  Copyright © 2020 Mateus Forgiarini da Silva. All rights reserved.
//

import Combine
import Foundation

protocol  NetworkManager {
    
    var session: URLSession { get }
    
}

extension NetworkManager {
    
    // MARK: - Decode
    private func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, Error> {
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return Just(data)
            .decode(type: T.self, decoder: decoder)
            .mapError { $0 }
            .eraseToAnyPublisher()
        
    }
    
    // MARK: - Get
    func get<T>(urlString: String?) -> AnyPublisher<T, Error> where T: Decodable  {
        guard let urlString = urlString else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        guard let url = URL(string: urlString) else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        guard let request = try? URLRequest(url: url, method: .get) else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: request)
            .mapError { $0 }
            .flatMap(maxPublishers: .max(1)) { pair in
                self.decode(pair.data)
        }
        .eraseToAnyPublisher()
    }
    
}

