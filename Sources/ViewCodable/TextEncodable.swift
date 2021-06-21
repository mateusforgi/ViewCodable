//
//  TextEncodable.swift
//  
//
//  Created by Mateus Forgiarini on 10/26/20.
//

import Foundation
public struct TextEncodable: Encodable {
   
    public var viewProperties: ViewPropertiesEncodable?
    public var padding: PaddingCodable?
    public var text: String
    public var font: FontEncodable?
    
    public init(text: String,
                font: FontEncodable? = nil) {
        self.text = text
        self.font = font
    }
}
