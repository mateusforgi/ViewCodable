//
//  File.swift
//  
//
//  Created by Mateus Forgiarini on 6/30/21.
//

import Combine
import SwiftUI

public struct ServerDrivenMainView: View {
    
    @ObservedObject var viewModel: ViewModel
    var destination: String
    
    public init(destination: String) {
        self.destination = destination
        self.viewModel = ViewModel(service: DependecyContainer.shared.newInstance()!)
    }
    
    public var body: some View {
        VStack {
            if viewModel.loading {
                LoadingView()
            } else {
                viewModel.dataSource
            }
        }.onAppear {
            self.viewModel.fetch(destination: destination)
        }
    }
}
