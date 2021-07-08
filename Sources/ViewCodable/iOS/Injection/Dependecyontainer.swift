//
//  File.swift
//  
//
//  Created by Mateus Forgiarini on 7/7/21.
//

import Foundation

final class Dependecyontainer {
    static let shared = Dependecyontainer()

    private init() {}

    private var viewModel: CodableService.Type?

    func register(instance: CodableService.Type) {
        viewModel = instance
    }

    func newInstance() -> CodableService? {
        return viewModel?.newInstance()
    }
}
