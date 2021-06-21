//
//  StackEncodable.swift
//  
//
//  Created by Mateus Forgiarini on 10/19/20.
//

import Foundation
import CoreGraphics

public struct StackEncodable: Encodable {
    
    public var vertical: Bool
    public var views: [AnyEncodable]
    public var horizontalAlignment: HorizontalAlignmentCodable? = nil
    public var verticalAlignment: VerticalAlignmentCodable? = nil
    public var spacing: CGFloat = 0
   
    public init(vertical: Bool,
                views: [AnyEncodable],
                horizontalAlignment: HorizontalAlignmentCodable? = nil,
                verticalAlignment: VerticalAlignmentCodable? = nil,
                spacing: CGFloat = 0) {
        self.vertical = vertical
        self.views = views
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
    }
}
