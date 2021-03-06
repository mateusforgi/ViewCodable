//
//  StackEncodable.swift
//  
//
//  Created by Mateus Forgiarini on 10/19/20.
//

import Foundation
import SwiftUI

public struct StackCodable: ServerDrivenView {
    
    public var navigationTitle: String?
    public var destination: String?
    public var vertical: Bool
    public var views: [AnyViewCodable]
    public var horizontalAlignment: HorizontalAlignmentCodable? = nil
    public var verticalAlignment: VerticalAlignmentCodable? = nil
    public var spacing: CGFloat = 0
    
    public init(vertical: Bool,
                views: [AnyViewCodable],
                horizontalAlignment: HorizontalAlignmentCodable? = nil,
                verticalAlignment: VerticalAlignmentCodable? = nil,
                spacing: CGFloat = 0,
                navigationTitle: String? = nil,
                destination: String? = nil) {
        self.vertical = vertical
        self.views = views
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.navigationTitle = navigationTitle
        self.destination = destination
    }
    
    @ViewBuilder public var body: some View {
        if vertical {
            VStack(alignment: horizontalAlignment?.alignment ?? .center, spacing: spacing) {
                getContent()
            }
        } else {
            HStack(alignment: verticalAlignment?.alignment ?? .top, spacing: spacing) {
                getContent()
            }
        }
    }
    
    @ViewBuilder func getContent() -> some View {
        ForEach((0..<views.count), id: \.self) {
            views[$0].body
        }
    }
}

#if os(iOS)
struct StackCodable_Preview: PreviewProvider {
    
    static let text = TextCodable(text: "hello world",
                font: FontCodable(size: 24, weight: FontWeightCodable(.bold)))
    
    static var previews: some View {
        StackCodable(vertical: true,
                     views: [AnyViewCodable(text),
                             AnyViewCodable(text)]).body
    }
}
#endif
