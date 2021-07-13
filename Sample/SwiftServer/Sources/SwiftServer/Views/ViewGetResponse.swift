//
//  HomeView.swift
//  
//
//  Created by Mateus Forgiarini on 10/3/20.
//

import SmokeHTTP1
import SmokeOperations
import SmokeOperationsHTTP1
import SmokeOperationsHTTP1Server
import Foundation
import ViewCodable

public struct ViewGetResponse: Encodable, Validatable {
    
    public var view: AnyViewCodable
    
    public init(data: AnyViewCodable) {
        self.view = data
    }
    
    public func validate() throws {}
}

extension ViewGetResponse: OperationHTTP1OutputProtocol {
    
    public var bodyEncodable: ViewGetResponse? { self }
    
    public var additionalHeadersEncodable: ViewGetResponse? { nil }
}

