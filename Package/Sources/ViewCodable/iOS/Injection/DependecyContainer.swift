//
//  File.swift
//  
//
//  Created by Mateus Forgiarini on 7/7/21.
//

import Foundation

public final class DependecyContainer {
    public static let shared = DependecyContainer()

    private init() {}

    private var viewModel: CodableService.Type?

    public func register(instance: CodableService) {
        viewModel = type(of: instance)
    }

    func newInstance() -> CodableService? {
        return viewModel?.newInstance()
    }
}
