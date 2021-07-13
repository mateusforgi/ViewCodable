//
//  File.swift
//  
//
//  Created by Mateus Forgiarini on 10/25/20.
//

import SmokeHTTP1
import SmokeOperations
import SmokeOperationsHTTP1
import SmokeOperationsHTTP1Server
import ViewCodable
import Foundation

func homeGetDetailOperation(
    input: HomeGetDetailRequest,
    context: ApplicationContext
) throws -> ViewGetResponse {
    
    let text = TextCodable(text: "Detail Page", font: FontCodable(size: 17, weight: FontWeightCodable(.black)))

    return ViewGetResponse(data: AnyViewCodable(text))
}

public struct HomeGetDetailRequest: Codable, Validatable, Equatable {
    
    public func validate() throws {}
}

extension HomeGetDetailRequest: OperationHTTP1InputProtocol {
    public static func compose(queryDecodableProvider: () throws -> HomeGetDetailRequest,
                               pathDecodableProvider: () throws -> HomeGetDetailRequest,
                               bodyDecodableProvider: () throws -> HomeGetDetailRequest,
                               headersDecodableProvider: () throws -> HomeGetDetailRequest)
    throws -> HomeGetDetailRequest {
        try queryDecodableProvider()
    }
}
