//
//  RowEncodable.swift
//  
//
//  Created by Mateus Forgiarini on 10/19/20.
//

import Foundation
public struct RowEncodable {
    public var title: String
    public var subTitle: String
    
    public init(title: String,
                subTitle: String) {
        self.title = title
        self.subTitle = subTitle
    }
}
