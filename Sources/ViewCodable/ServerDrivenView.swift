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
}
