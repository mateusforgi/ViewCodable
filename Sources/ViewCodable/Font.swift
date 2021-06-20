//
//  File.swift
//  
//
//  Created by Mateus Forgiarini on 11/9/20.
//

import Foundation

public struct Font: Encodable {

    var size: CGFloat
    var weight: FontWeight
    
    public init(size: CGFloat, weight: FontWeight) {
        self.size = size
        self.weight = weight
    }
}

public struct FontWeight: Encodable {
    var value: CGFloat
    
    public init(_ value: CGFloat) {
        self.value = value
    }
}
