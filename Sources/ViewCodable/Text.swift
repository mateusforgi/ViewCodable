//
//  Text.swift
//  
//
//  Created by Mateus Forgiarini on 10/26/20.
//

import Foundation
public struct Text: Encodable {
   
    public var viewProperties: ViewProperties?
    public var padding: PaddingCodable?
    public var text: String
    public var font: Font?
    
    public init(text: String,
                font: Font? = nil) {
        self.text = text
        self.font = font
    }
}
