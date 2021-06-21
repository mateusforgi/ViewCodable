//
//  PaddingCodable.swift
//  
//
//  Created by Mateus Forgiarini on 10/19/20.
//

import Foundation
import CoreGraphics

public struct PaddingCodable: Codable {
    public var top: CGFloat?
    public var bottom: CGFloat?
    public var leading: CGFloat?
    public var trailing: CGFloat?
    
    public init(top: CGFloat? = nil,
                bottom: CGFloat? = nil,
                leading: CGFloat? = nil,
                trailing: CGFloat? = nil) {
        self.top = top
        self.bottom = bottom
        self.leading = leading
        self.trailing = trailing
    }
}
