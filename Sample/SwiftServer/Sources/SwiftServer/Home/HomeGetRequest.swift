//
//  HomeGetRequest.swift
//  
//
//  Created by Mateus Forgiarini on 10/3/20.
//

import SmokeHTTP1
import SmokeOperations
import SmokeOperationsHTTP1
import SmokeOperationsHTTP1Server
import ViewCodable
import Foundation

func homeGetOperation(
    input: HomeGetRequest,
    context: ApplicationContext
) throws -> ViewGetResponse {
    let header = TextCodable(text: "Blue Berry",
                            font: FontCodable(size: 17,
                                                weight: FontWeightCodable(.bold)))
    let description = TextCodable(text: "Are perennial flowering plants with blue or purple berries",
                                  font: FontCodable(size: 17,
                                                      weight: FontWeightCodable(.light)))
    
    let descriptionStack = StackCodable(vertical: true,
                                        views: [AnyViewCodable(header),
                                                AnyViewCodable(description)],
                                        horizontalAlignment: HorizontalAlignmentCodable(.leading),
                                        spacing: 10)
    
    let image = ImageCodable(url: "https://a.thumbs.redditmedia.com/5YByQCGvNuHALGL6Xq9fJDm96N2yFw1kad1I1-LKKk4.png")
    
    let container = StackCodable(vertical: false,
                                 views: [AnyViewCodable(image),
                                         AnyViewCodable(descriptionStack)],
                                 horizontalAlignment: HorizontalAlignmentCodable(.trailing),
                                 verticalAlignment: VerticalAlignmentCodable(.top),
                                 spacing: 10,
                                 navigationTitle: "Home",
                                 destination: "homeDetail")
    
    let list = ListCodable(cells: [AnyViewCodable(container), AnyViewCodable(container)])
    return ViewGetResponse(data: AnyViewCodable(list))
}

public struct HomeGetRequest: Codable, Validatable, Equatable {
    
    public func validate() throws {}
}

extension HomeGetRequest: OperationHTTP1InputProtocol {
    public static func compose(queryDecodableProvider: () throws -> HomeGetRequest,
                               pathDecodableProvider: () throws -> HomeGetRequest,
                               bodyDecodableProvider: () throws -> HomeGetRequest,
                               headersDecodableProvider: () throws -> HomeGetRequest)
    throws -> HomeGetRequest {
        try queryDecodableProvider()
    }
}
