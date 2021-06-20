//
//  List.swift
//  
//
//  Created by Mateus Forgiarini on 10/19/20.
//

import Foundation

public struct List {

    public var cells: [AnyEncodable]
    
    public init(cells: [AnyEncodable]) {
        self.cells = cells
    }
}
