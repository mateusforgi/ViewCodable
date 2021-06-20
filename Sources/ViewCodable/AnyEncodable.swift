//
//  File.swift
//  
//
//  Created by Mateus Forgiarini on 6/19/21.
//

import Foundation

public struct AnyEncodable: Encodable {

    private let _encode: (Encoder) throws -> Void
    public init<T: Encodable>(_ wrapped: T) {
        _encode = wrapped.encode
    }

    public func encode(to encoder: Encoder) throws {
        try _encode(encoder)
    }
}
