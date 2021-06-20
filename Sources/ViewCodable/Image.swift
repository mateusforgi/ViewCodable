//
//  Image.swift
//  
//
//  Created by Mateus Forgiarini on 10/26/20.
//

import Foundation

public struct Image: Encodable {
    public var url: String

    public init(url: String) {
        self.url = url
    }
}
