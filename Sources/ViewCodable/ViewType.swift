//
//  File.swift
//  
//
//  Created by Mateus Forgiarini on 6/22/21.
//

import Foundation

public enum ViewType: CaseIterable {
    case none, list, stack, text, image
    
    init(rawValue: String) {
        switch rawValue {
        case String(describing: ListEncodable.self): self = .list
        case String(describing: ListEncodable.self): self = .stack
        case String(describing: TextCodable.self): self = .text
        case String(describing: ImageCodable.self): self = .image
        default:
            self = .none
        }
    }
}
