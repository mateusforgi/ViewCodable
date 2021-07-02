//
//  FrameCodable.swift
//  
//
//  Created by Mateus Forgiarini on 11/9/20.
//

import Foundation
import SwiftUI

public struct FrameCodable: ServerDrivenView {
   
    public var navigationTitle: String?
    public var destination: String?
    public var width: CGFloat
    public var height: CGFloat
    public var alignment: AlignmentCodable
    
    public init(width: CGFloat, height: CGFloat, alignment: AlignmentCodable) {
        self.width = width
        self.height = height
        self.alignment = alignment
    }
    
    public var body: some View {
        frame(width: width, height: height, alignment: alignment.alignment)
    }
}
