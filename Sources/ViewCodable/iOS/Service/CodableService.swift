//
//  File.swift
//  
//
//  Created by Mateus Forgiarini on 7/7/21.
//

import Combine
public protocol CodableService: Initializable {
    func get(destination: String) -> AnyPublisher<AnyViewCodable, Error>
}
