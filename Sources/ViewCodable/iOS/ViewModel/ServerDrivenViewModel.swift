//
//  File.swift
//  
//
//  Created by Mateus Forgiarini on 6/30/21.
//

import Combine
import SwiftUI

public protocol ServerDrivenViewModel: ObservableObject {
    var loading: Bool { get set }
    var dataSource: AnyViewCodable? { get set }
    func fetch(destination: String)
}
