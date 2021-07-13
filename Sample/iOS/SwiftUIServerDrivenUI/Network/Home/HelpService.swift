//
//  HomeService.swift
//  SwiftUIServerDrivenUI
//
//  Created by Mateus Forgiarini on 10/3/20.
//  Copyright © 2020 Mateus Forgiarini da Silva. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
import ViewCodable

class HomeService: CodableService {
    
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    static func newInstance() -> CodableService {
        HomeService(session: .shared)
    }
}

extension HomeService: NetworkManager {
  
    func get(destination: String) -> AnyPublisher<ViewResponse, Error> {
        return get(urlString: "http://localhost:8080/\(destination)")
    }
}
