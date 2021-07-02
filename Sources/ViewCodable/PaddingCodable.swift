//
//  PaddingCodable.swift
//  
//
//  Created by Mateus Forgiarini on 10/19/20.
//

import Foundation
import SwiftUI

public struct PaddingCodable: ServerDrivenView {
    
    public var navigationTitle: String?
    public var destination: String?
    public var top: CGFloat?
    public var bottom: CGFloat?
    public var leading: CGFloat?
    public var trailing: CGFloat?
    
    public init(top: CGFloat? = nil,
                bottom: CGFloat? = nil,
                leading: CGFloat? = nil,
                trailing: CGFloat? = nil) {
        self.top = top
        self.bottom = bottom
        self.leading = leading
        self.trailing = trailing
    }
    
    public var body: some View {
        padding(.top, top)
            .padding(.leading, leading)
            .padding(.bottom, bottom)
            .padding(.trailing, trailing)
    }
}
