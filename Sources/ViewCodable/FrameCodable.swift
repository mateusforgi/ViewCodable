//
//  FrameCodable.swift
//  
//
//  Created by Mateus Forgiarini on 11/9/20.
//

import Foundation
import CoreGraphics

public struct FrameCodable: Codable {
    var width: CGFloat?
    var height: CGFloat?
    
    public init(width: CGFloat?, height: CGFloat?) {
        self.width = width
        self.height = height
    }
}
