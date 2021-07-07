//
//  AnyViewCodable.swift
//  
//
//  Created by Mateus Forgiarini on 6/19/21.
//

import SwiftUI

@frozen public struct AnyViewCodable: ServerDrivenView {
    public var navigationTitle: String?
    public var destination: String?
    public var type: String
    public let value: Any
    
    public init<T: ServerDrivenView>(_ value: T) {
        self.value = value
        self.navigationTitle = value.navigationTitle
        self.destination = value.destination
        self.type = value.type
    }
    
    enum CodingKeys : String, CodingKey {
        case value
        case type
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let text = try? container.decode(TextCodable.self) {
            self.init(text)
        } else if let image = try? container.decode(ImageCodable.self) {
            self.init(image)
        } else if let list = try? container.decode(ListCodable.self) {
            self.init(list)
        } else if let stack = try? container.decode(StackCodable.self) {
            self.init(stack)
        } else if let padding = try? container.decode(PaddingCodable.self) {
            self.init(padding)
        } else if let frame = try? container.decode(FrameCodable.self) {
            self.init(frame)
        } else if let cornerRadius = try? container.decode(CornerRadiusCodable.self) {
            self.init(cornerRadius)
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode container")
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        
        switch ViewType(rawValue: type) {
        case .text:
            try encode(to: &container, value: value, type: TextCodable.self)
        case .none:
            throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: container.codingPath, debugDescription: "Cannot encode value"))
        case .list:
            try encode(to: &container, value: value, type: ListCodable.self)
        case .stack:
            try encode(to: &container, value: value, type: StackCodable.self)
        case .image:
            try encode(to: &container, value: value, type: ImageCodable.self)
        case .padding:
            try encode(to: &container, value: value, type: PaddingCodable.self)
        case .frame:
            try encode(to: &container, value: value, type: FrameCodable.self)
        case .cornerRadius:
            try encode(to: &container, value: value, type: CornerRadiusCodable.self)
        }
    }

    func encode<T: ServerDrivenView>(to container: inout KeyedEncodingContainer<AnyViewCodable.CodingKeys>,
                                     value: Any,
                                     type: T.Type) throws {
        try container.encode(value as? T, forKey: .value)
    }
    
    @ViewBuilder public var body: some View {
        switch ViewType(rawValue: type) {
        case .image:
            (value as? ImageCodable)
        case .none:
            Spacer()
        case .list:
            (value as? ListCodable)
        case .stack:
            (value as? StackCodable)
        case .text:
            (value as? TextCodable)
        case .padding:
            (value as? PaddingCodable)
        case .frame:
            (value as? FrameCodable)
        case .cornerRadius:
            (value as? CornerRadiusCodable)
        }
    }
}
