//
//  TextEncodable.swift
//  
//
//  Created by Mateus Forgiarini on 10/26/20.
//

import SwiftUI

public struct TextCodable: ServerDrivenView {
    public var navigationTitle: String?
    public var destination: String?
    public var text: String
    public var font: FontCodable
    
    public init(text: String,
                font: FontCodable,
                navigationTitle: String?,
                destination: String?) {
        self.text = text
        self.font = font
        self.navigationTitle = navigationTitle
        self.destination = destination
    }
    
   public var body: some View {
        Text(text).font(Font.system(size: font.size, weight: font.weight.weight))
    }
}

