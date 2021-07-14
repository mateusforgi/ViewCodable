//
//  ListEncodable.swift
//  
//
//  Created by Mateus Forgiarini on 10/19/20.
//

import SwiftUI

public struct ListCodable: ServerDrivenView {
  
    public var navigationTitle: String?
    public var destination: String?
    public var cells: [AnyViewCodable]
    
    public init(cells: [AnyViewCodable],
                navigationTitle: String? = nil,
                destination: String? = nil) {
        self.cells = cells
        self.navigationTitle = navigationTitle
        self.destination = destination
    }
    
    public var body: some View {
        getList()
    }
    
    @ViewBuilder func getList() -> some View {
        List((0..<cells.count), id: \.self) { index in
            cells[index].body
        }
    }
}

#if os(iOS)
struct ListCodable_Preview: PreviewProvider {
    
    static let text = TextCodable(text: "hello world",
                font: FontCodable(size: 24, weight: FontWeightCodable(.bold)))
    
    static var previews: some View {
        ListCodable(cells: [AnyViewCodable(text),
                             AnyViewCodable(text)]).body
    }
}
#endif
