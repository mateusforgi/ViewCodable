//
//  Alignment.swift
//  
//
//  Created by Mateus Forgiarini on 11/9/20.
//

import Foundation
public struct Alignment: Encodable {
    var value: Int
    public init(_ value: Int) {
        self.value = value
    }
}

public struct HorizontalAlignment: Encodable {
    var value: Int
    public init(_ value: Int) {
        self.value = value
    }
}

public struct VerticalAlignment: Encodable {
    var value: Int
    public init(_ value: Int) {
        self.value = value
    }
}
