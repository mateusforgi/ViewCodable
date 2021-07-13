//
//  ModelOperations.swift
//  
//
//  Created by Mateus Forgiarini on 10/3/20.
//

import SmokeOperations
import SmokeOperationsHTTP1

public enum ModelOperations: String, Hashable, OperationIdentity {
    
    case homeGet
    case homeDetail
    
    public var operationPath: String {
        switch self {
        case .homeGet:
            return "/home"
        case .homeDetail:
            return "/homeDetail"
        }
    }
}

extension ModelOperations: CustomStringConvertible {
    
    public var description: String { rawValue }
}

public func addOperations<SelectorType: SmokeHTTP1HandlerSelector>(
    selector: inout SelectorType
) where SelectorType.ContextType == ApplicationContext,
        SelectorType.OperationIdentifer == ModelOperations {
    
    selector.addHandlerForOperation(.homeGet,
                                    httpMethod: .GET,
                                    operation: homeGetOperation,
                                    allowedErrors: [(ErrorTypes.serverError, 500)])
    
    
    selector.addHandlerForOperation(.homeDetail,
                                    httpMethod: .GET,
                                    operation: homeGetDetailOperation,
                                    allowedErrors: [(ErrorTypes.serverError, 500)])
    
}
