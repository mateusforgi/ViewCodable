//
//  BackgroundColorCodable.swift
//  
//
//  Created by Mateus Forgiarini on 7/6/21.
//

import SwiftUI

struct BackgroundColorCodable: ServerDrivenView {

    public var view: AnyViewCodable
    public var hexcolor: String
    
    public var body: some View {
        view.background(Color(hex: hexcolor))
    }
}
