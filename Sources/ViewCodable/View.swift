//
//  View.swift
//  
//
//  Created by Mateus Forgiarini on 10/19/20.
//

import Foundation

public struct ViewProperties: Encodable {
    var padding: PaddingCodable?
    var destination: String?
    var frame: Frame?
    var cornerRadius: CGFloat?
    var alignment: Alignment?
    var navigationTitle: String?
    
    public init(padding: PaddingCodable? = nil,
                destination: String? = nil,
                frame: Frame? = nil,
                cornerRadius: CGFloat? = nil,
                alignment: Alignment? = nil,
                navigationTitle: String? = nil) {
        self.padding = padding
        self.destination = destination
        self.frame = frame
        self.cornerRadius = cornerRadius
        self.alignment = alignment
        self.navigationTitle = navigationTitle
    }
}

public struct View<T: Encodable> : Encodable, Equatable {
    var type: String
    var id: String
    var properties: ViewProperties?
    var view: T?
    
    public init(id: String, view: T, properties: ViewProperties? = nil) {
        self.id = id
        self.view = view
        self.type = String(describing: T.self)
        self.properties = properties
    }
}

public extension View {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
