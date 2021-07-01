//
//  File.swift
//  
//
//  Created by Mateus Forgiarini on 6/30/21.
//

import Foundation

public protocol ViewResponse: Codable {
    var view: AnyViewCodable { get set }
}
