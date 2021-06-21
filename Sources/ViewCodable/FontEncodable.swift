//
//  FontEncodable.swift
//  
//
//  Created by Mateus Forgiarini on 11/9/20.
//

import SwiftUI

public struct FontEncodable: Codable {
    
    public var size: CGFloat
    public var weight: FontWeightEncodable
    
    public init(size: CGFloat, weight: FontWeightEncodable) {
        self.size = size
        self.weight = weight
    }
}

public struct FontWeightEncodable: Codable {
    var value: Value
    
    @frozen public enum Value: String, Codable {
        case black
        case bold
        case heavy
        case light
        case medium
        case regular
        case semibold
        case thin
        case ultraLight
    }
   
    public init(_ value: Value) {
        self.value = value
    }
    
    public var weight: Font.Weight {
        switch value {
        case .black:
            return .black
        case .bold:
            return .bold
        case .heavy:
            return .heavy
        case .light:
            return .light
        case .medium:
            return .medium
        case .regular:
            return .regular
        case .semibold:
            return .semibold
        case .thin:
            return .thin
        case .ultraLight:
            return .ultraLight
        }
    }
}
