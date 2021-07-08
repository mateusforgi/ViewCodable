//
//  File.swift
//  
//
//  Created by Mateus Forgiarini on 7/7/21.
//

import Combine
import Foundation

class ViewModel: ObservableObject, Identifiable, ServerDrivenViewModel {

    // MARK: - Published
    @Published var dataSource: AnyViewCodable?
    @Published var loading: Bool = false

    // MARK: - Private Variables
    private let service: CodableService
    private var disposables = Set<AnyCancellable>()


    // MARK: - Constructor
    init(service: CodableService) {
        self.service = service
    }

    //MARK: - Public Methods
    public func fetch(destination: String) {
        loading = true
        #warning("TODO - HANDLE ERRORS")
        service.get(destination: destination)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { value in
                    switch value {
                    case .failure(let error):
                        print(error)
                        break
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] response in
                    self?.loading = false
                    self?.dataSource = response.view
                }
            ).store(in: &disposables)
    }

}
