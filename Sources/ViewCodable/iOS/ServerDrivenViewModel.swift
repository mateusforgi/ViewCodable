//
//  File.swift
//  
//
//  Created by Mateus Forgiarini on 6/30/21.
//

import Combine

public protocol ServerDrivenViewModel: ObservableObject {
    associatedtype T: ServerDrivenView
    var loading: Bool { get set }
    var dataSource: T? { get set }
    func fetch(destination: String)
}
