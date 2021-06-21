//
//  FrameEncodable.swift
//  
//
//  Created by Mateus Forgiarini on 11/9/20.
//

import Foundation

public struct FrameEncodable: Encodable {
    var width: CGFloat?
    var height: CGFloat?
    
    public init(width: CGFloat?, height: CGFloat?) {
        self.width = width
        self.height = height
    }
}
