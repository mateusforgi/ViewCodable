//
//  AnyViewCodable.swift
//  
//
//  Created by Mateus Forgiarini on 6/19/21.
//

import SwiftUI

@frozen public struct AnyViewCodable: Codable {
    public let value: Any
    private let type: ViewType
    
    public init<T: ServerDrivenView>(_ value: T?) {
        self.value = value ?? ()
        self.type = ViewType(rawValue: String(describing: T.self))
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let text = try? container.decode(TextCodable.self) {
            self.init(text)
        } else if let text = try? container.decode(ImageCodable.self) {
            self.init(text)
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode container")
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        if let text = value as? TextCodable {
            try container.encode(text)
        } else if let image = value as? ImageCodable {
            try container.encode(image)
        } else {
            throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: container.codingPath, debugDescription: "Cannot encode value"))
        }
    }
    
    @ViewBuilder func getView() -> some View {
        switch type {
        case .image:
            (value as? ImageCodable)?.body
        case .none:
            (value as? ImageCodable)?.body
        case .list:
            (value as? ImageCodable)?.body
        case .stack:
            (value as? ImageCodable)?.body
        case .text:
            (value as? ImageCodable)?.body
        }
    }
}
