//
//  File.swift
//  
//
//  Created by Mateus Forgiarini on 10/19/20.
//

import Foundation

public struct Stack: Encodable {
    
    public var vertical: Bool
    public var views: [AnyEncodable]
    public var horizontalAlignment: HorizontalAlignment? = nil
    public var verticalAlignment: VerticalAlignment? = nil
    public var spacing: CGFloat = 0
   
    public init(vertical: Bool,
                views: [AnyEncodable],
                horizontalAlignment: HorizontalAlignment? = nil,
                verticalAlignment: VerticalAlignment? = nil,
                spacing: CGFloat = 0) {
        self.vertical = vertical
        self.views = views
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
    }
}
