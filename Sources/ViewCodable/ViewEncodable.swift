//
//  ViewEncodable.swift
//  
//
//  Created by Mateus Forgiarini on 10/19/20.
//

import Foundation
import CoreGraphics

public struct ViewPropertiesEncodable: Encodable {
    var padding: PaddingCodable?
    var destination: String?
    var frame: FrameEncodable?
    var cornerRadius: CGFloat?
    var alignment: AlignmentCodable?
    var navigationTitle: String?
    
    public init(padding: PaddingCodable? = nil,
                destination: String? = nil,
                frame: FrameEncodable? = nil,
                cornerRadius: CGFloat? = nil,
                alignment: AlignmentCodable? = nil,
                navigationTitle: String? = nil) {
        self.padding = padding
        self.destination = destination
        self.frame = frame
        self.cornerRadius = cornerRadius
        self.alignment = alignment
        self.navigationTitle = navigationTitle
    }
}

public struct ViewEncodable<T: Encodable> : Encodable, Equatable {
    var type: String
    var id: String
    var properties: ViewPropertiesEncodable?
    var view: T?
    
    public init(id: String, view: T, properties: ViewPropertiesEncodable? = nil) {
        self.id = id
        self.view = view
        self.type = String(describing: T.self)
        self.properties = properties
    }
}

public extension ViewEncodable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
