//
//  LibraryViewContent.swift
//  
//
//  Created by Mateus Forgiarini on 7/13/21.
//

import SwiftUI

@available(iOS 14.0, *)
@available(macOS 11.0, *)
struct LibraryViewContent: LibraryContentProvider {
    
    var views: [LibraryItem] {
        // MARK: - TextCodable
        LibraryItem(TextCodable(text: "hello world",
                                font: FontCodable(size: 17,
                                                  weight: FontWeightCodable(.regular))))
        
        LibraryItem(TextCodable(text: "hello world",
                                font: FontCodable(size: 17,
                                                  weight: FontWeightCodable(.regular)),
                                navigationTitle: nil,
                                destination: nil),
                    title: "Text Codable with navigation")
        
        // MARK: - StackCodable
        LibraryItem(StackCodable(vertical: true, views: []))
        
        // MARK: - ListCodable
        LibraryItem(ListCodable(cells: []))
    }
}
