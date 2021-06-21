//
//  FontEncodable.swift
//  
//
//  Created by Mateus Forgiarini on 11/9/20.
//

import Foundation
import CoreGraphics

public struct FontEncodable: Encodable {

    var size: CGFloat
    var weight: FontWeightEncodable
    
    public init(size: CGFloat, weight: FontWeightEncodable) {
        self.size = size
        self.weight = weight
    }
}

public struct FontWeightEncodable: Encodable {
    var value: CGFloat
    
    public init(_ value: CGFloat) {
        self.value = value
    }
}
