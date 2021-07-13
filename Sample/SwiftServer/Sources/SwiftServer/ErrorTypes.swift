//
//  ErrorTypes.swift
//  
//
//  Created by Mateus Forgiarini on 10/3/20.
//

import SmokeOperations
import SmokeOperationsHTTP1

public struct ErrorTypes: OptionSet {
  public let rawValue: Int
  
  public init(rawValue: Int) {
    self.rawValue = rawValue
  }
  
  public static let serverError = ErrorTypes(rawValue: 1)
}

extension ErrorTypes: ErrorIdentifiableByDescription {
  public var description: String {
    switch rawValue {
    case 1:
      return "serverError"
    default:
      return ""
    }
  }
}
