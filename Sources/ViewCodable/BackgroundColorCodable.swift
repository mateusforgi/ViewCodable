//
//  BackgroundColorCodable.swift
//  
//
//  Created by Mateus Forgiarini on 7/6/21.
//

import SwiftUI

public struct BackgroundColorCodable: ServerDrivenView {

    public var view: AnyViewCodable
    public var hexColor: String
    
    public init(view: AnyViewCodable,
                hexColor: String) {
        self.view = view
        self.hexColor = hexColor
    }
    
    public var body: some View {
        view.background(Color(hex: hexColor))
    }
}
