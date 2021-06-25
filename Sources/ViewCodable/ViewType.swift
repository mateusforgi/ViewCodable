//
//  File.swift
//  
//
//  Created by Mateus Forgiarini on 6/22/21.
//

import Foundation

public enum ViewType: CaseIterable {
    case none, list, stack, text, image
    
    public init(rawValue: String) {
        switch rawValue {
        case String(describing: ListCodable.self): self = .list
        case String(describing: StackCodable.self): self = .stack
        case String(describing: TextCodable.self): self = .text
        case String(describing: ImageCodable.self): self = .image
        default:
            self = .none
        }
    }
}
