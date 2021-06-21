//
//  Alignment.swift
//  
//
//  Created by Mateus Forgiarini on 11/9/20.
//

import Foundation
import SwiftUI

public struct AlignmentCodable: Codable {
    
    @frozen public enum Value: String, Codable {
        case center, leading, trailing, top, bottom, topLeading, topTrailing, bottomLeading, bottomTrailing
    }
    
    var value: Value
    
    public init(_ value: Value) {
        self.value = value
    }
    
    var alignment: Alignment {
        switch value {
        case .center:
            return .center
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        case .top:
            return .top
        case .bottom:
            return .bottom
        case .topLeading:
            return .topLeading
        case .topTrailing:
            return .topTrailing
        case .bottomLeading:
            return .bottomLeading
        case .bottomTrailing:
            return .bottomTrailing
        }
    }
}

public struct HorizontalAlignmentCodable: Codable {
    
    @frozen public enum Value: String, Codable {
        case leading, center, trailing
    }
    
    var value: Value
    
    public init(_ value: Value) {
        self.value = value
    }
    
    var alignment: HorizontalAlignment {
        switch value {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }
}

public struct VerticalAlignmentCodable: Codable {
    
    @frozen public enum Value: String, Codable {
        case top, center, bottom, firstTextBaseline, lastTextBaseline
    }
    
    var value: Value
    
    public init(_ value: Value) {
        self.value = value
    }
    
    var alignment: VerticalAlignment {
        switch value {
        case .top:
            return .top
        case .center:
            return .center
        case .bottom:
            return .bottom
        case .firstTextBaseline:
            return .firstTextBaseline
        case .lastTextBaseline:
            return .lastTextBaseline
        }
    }
}
