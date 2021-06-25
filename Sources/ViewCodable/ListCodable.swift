//
//  ListEncodable.swift
//  
//
//  Created by Mateus Forgiarini on 10/19/20.
//

import SwiftUI

public struct ListCodable: ServerDrivenView {

    public var cells: [AnyViewCodable]
    
    public init(cells: [AnyViewCodable]) {
        self.cells = cells
    }
    
    public var body: some View {
        getList()
    }
    
    @ViewBuilder func getList() -> some View {
        List((0...cells.count), id: \.self) { index in
            cells[index].body
        }
    }
}
