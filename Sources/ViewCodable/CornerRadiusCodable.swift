//
//  CornerRadiusCodable.swift
//  
//
//  Created by Mateus Forgiarini on 6/28/21.
//

import SwiftUI
#if os(iOS)
import UIKit
#endif

public struct CornerRadiusCodable: ServerDrivenView {
    
    public var topLeft: CGFloat
    public var topRight: CGFloat
    public var bottomLeft: CGFloat
    public var bottomRight: CGFloat
    
    public init(topLeft: CGFloat,
                topRight: CGFloat,
                bottomLeft: CGFloat,
                bottomRight: CGFloat) {
        self.topLeft = topLeft
        self.topRight = topRight
        self.bottomLeft = bottomLeft
        self.bottomRight = bottomRight
    }
    
    public var body: some View {
        #if os(iOS)
        cornerRadius(topLeft, corners: .topLeft)
        cornerRadius(topRight, corners: .topRight)
        cornerRadius(bottomLeft, corners: .bottomLeft)
        cornerRadius(bottomRight, corners: .bottomRight)
        #else
        Spacer()
        #endif
    }
}

#if os(iOS)
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
#endif
