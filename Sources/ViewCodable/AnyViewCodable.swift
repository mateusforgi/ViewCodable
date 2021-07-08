//
//  AnyViewCodable.swift
//  
//
//  Created by Mateus Forgiarini on 6/19/21.
//

import SwiftUI
import Combine

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
        case destination
    }
    
    public init(from decoder: Decoder) throws {
        var container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.destination = try container.decodeIfPresent(String.self, forKey: .destination)

        switch ViewType(rawValue: self.type) {
        case .text:
            self.value = try AnyViewCodable.decode(to: &container, type: TextCodable.self)
        case .none:
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [CodingKeys.value], debugDescription: "Cannot decode view"))
        case .list:
            self.value = try AnyViewCodable.decode(to: &container, type: ListCodable.self)
        case .stack:
            self.value = try AnyViewCodable.decode(to: &container, type: StackCodable.self)
        case .image:
            self.value = try AnyViewCodable.decode(to: &container, type: ImageCodable.self)
        case .padding:
            self.value = try AnyViewCodable.decode(to: &container, type: PaddingCodable.self)
        case .frame:
            self.value = try AnyViewCodable.decode(to: &container, type: FrameCodable.self)
        case .cornerRadius:
            self.value = try AnyViewCodable.decode(to: &container, type: CornerRadiusCodable.self)
        case .backgroundColor:
            self.value = try AnyViewCodable.decode(to: &container, type: BackgroundColorCodable.self)
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
        case .backgroundColor:
            try encode(to: &container, value: value, type: BackgroundColorCodable.self)
        }
    }

    func encode<T: ServerDrivenView>(to container: inout KeyedEncodingContainer<AnyViewCodable.CodingKeys>,
                                     value: Any,
                                     type: T.Type) throws {
        try container.encode(value as? T, forKey: .value)
    }
    
    
    static func decode<T: ServerDrivenView>(to container: inout KeyedDecodingContainer<AnyViewCodable.CodingKeys>,
                                     type: T.Type) throws -> T {
        return try container.decode(type, forKey: .value)
    }
    
    
    @ViewBuilder public var body: some View {
        if let destination = destination {
            
            NavigationLink(destination: ServerDrivenMainView(destination: destination)) {
                #if os(iOS)
                view.navigationBarTitle(navigationTitle ?? String())
                #else
                view
                #endif
            }
        } else {
            view
        }
    }
    
    
    @ViewBuilder var view: some View {
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
        case .backgroundColor:
            (value as? BackgroundColorCodable)
        }
    }
}
