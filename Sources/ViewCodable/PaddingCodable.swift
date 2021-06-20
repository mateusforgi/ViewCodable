//
//  PaddingCodable.swift
//  
//
//  Created by Mateus Forgiarini on 10/19/20.
//

import Foundation

public struct PaddingCodable: Codable {
    var top: CGFloat?
    var bottom: CGFloat?
    var leading: CGFloat?
    var trailing: CGFloat?
    
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
