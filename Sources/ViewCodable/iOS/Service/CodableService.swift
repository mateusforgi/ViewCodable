//
//  File.swift
//  
//
//  Created by Mateus Forgiarini on 7/7/21.
//

import Combine
public protocol CodableService {
    static func newInstance() -> CodableService
    func get(destination: String) -> AnyPublisher<AnyViewCodable, Error>
}
