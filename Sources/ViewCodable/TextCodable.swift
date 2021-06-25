//
//  TextEncodable.swift
//  
//
//  Created by Mateus Forgiarini on 10/26/20.
//

import SwiftUI

public struct TextCodable: ServerDrivenView {
    public var text: String
    public var font: FontCodable
    
    public init(text: String,
                font: FontCodable) {
        self.text = text
        self.font = font
    }
    
   public var body: some View {
        Text(text).font(Font.system(size: font.size, weight: font.weight.weight))
    }
}

