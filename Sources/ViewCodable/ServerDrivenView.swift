//
//  File.swift
//
//
//  Created by Mateus Forgiarini on 6/21/21.
//

import SwiftUI

public protocol ServerDrivenView: View, Codable {
    var destination: String? { get }
    var navigationTitle: String? { get }
    var type: ViewType { get }
}

public extension ServerDrivenView {
    var destination: String? {
        return nil
    }
    
    var navigationTitle: String? {
        return nil
    }
    
    var type: ViewType {
        ViewType(rawValue: String(describing: Self.self))
    }
}
