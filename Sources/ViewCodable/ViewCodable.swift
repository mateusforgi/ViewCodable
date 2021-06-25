//
//  ViewEncodable.swift
//  
//
//  Created by Mateus Forgiarini on 10/19/20.
//

import Foundation
import SwiftUI

public struct ViewPropertiesCodable: Codable {
    var padding: PaddingCodable?
    var destination: String?
    var frame: FrameCodable?
    var cornerRadius: CGFloat?
    var alignment: AlignmentCodable?
    var navigationTitle: String?
    
    public init(padding: PaddingCodable? = nil,
                destination: String? = nil,
                frame: FrameCodable? = nil,
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

public struct ViewCodable<T: ServerDrivenView>: Encodable, Equatable {
    var type: String
    var id: String
    var properties: ViewPropertiesCodable?
    var data: T
    
    public init(id: String, data: T, properties: ViewPropertiesCodable? = nil) {
        self.id = id
        self.data = data
        self.type = String(describing: T.self)
        self.properties = properties
    }
}

public extension ViewCodable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
