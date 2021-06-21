//
//  ListEncodable.swift
//  
//
//  Created by Mateus Forgiarini on 10/19/20.
//

import Foundation

public struct ListEncodable {

    public var cells: [AnyEncodable]
    
    public init(cells: [AnyEncodable]) {
        self.cells = cells
    }
}