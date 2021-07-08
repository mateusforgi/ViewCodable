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
    }
    
    public init(from decoder: Decoder) throws {
        var container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)

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
        switch ViewType(rawValue: type) {
        case .image:
            Wrapper<ImageCodable>(value: value).body
        case .none:
            Spacer()
        case .list:
            Wrapper<ListCodable>(value: value).body
        case .stack:
            Wrapper<StackCodable>(value: value).body
        case .text:
            Wrapper<TextCodable>(value: value).body
        case .padding:
            Wrapper<PaddingCodable>(value: value).body
        case .frame:
            Wrapper<FrameCodable>(value: value).body
        case .cornerRadius:
            Wrapper<CornerRadiusCodable>(value: value).body
        case .backgroundColor:
            Wrapper<BackgroundColorCodable>(value: value).body
        }
    }
    
    struct Wrapper<T: ServerDrivenView> {
        
        let value: Any
        
        @ViewBuilder public var body: some View {
            let view = (value as! T)
            if let destination = view.destination {
                
                NavigationLink(destination: ServerDrivenMainView(destination: destination)) {
                    #if os(iOS)
                    view.navigationBarTitle(view.navigationTitle ?? String())
                    #else
                    view
                    #endif
                }
            } else {
                view
            }
        }
    }
}
