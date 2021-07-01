//
//  File.swift
//  
//
//  Created by Mateus Forgiarini on 6/30/21.
//

import SwiftUI
import Combine

public struct ServerDrivenStarterView<T: ServerDrivenViewModel>: View {
    
    @ObservedObject var viewModel: T
    let destination: String
    
    public init(destination: String, viewModel: T) {
        self.destination = destination
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationView {
            ServerDrivenMainView(viewModel: viewModel, destination: destination)
        }
    }
}
