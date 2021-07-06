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
    public let value: Any
    private let type: ViewType
    
    public init<T: ServerDrivenView>(_ value: T?) {
        self.value = value ?? ()
        self.navigationTitle = value?.navigationTitle
        self.destination = value?.destination
        self.type = ViewType(rawValue: String(describing: T.self))
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
        var container = encoder.singleValueContainer()
        
        if let text = value as? TextCodable {
            try container.encode(text)
        } else if let image = value as? ImageCodable {
            try container.encode(image)
        } else if let list = value as? ListCodable {
            try container.encode(list)
        } else if let stack = value as? StackCodable {
            try container.encode(stack)
        } else if let padding = value as? PaddingCodable {
            try container.encode(padding)
        } else if let frame = value as? FrameCodable {
            try container.encode(frame)
        } else if let cornerRadius = value as? CornerRadiusCodable {
            try container.encode(cornerRadius)
        } else {
            throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: container.codingPath, debugDescription: "Cannot encode value"))
        }
    }
    
    @ViewBuilder public var body: some View {
        switch type {
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
