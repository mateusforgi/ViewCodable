//
//  File.swift
//  
//
//  Created by Mateus Forgiarini on 6/30/21.
//

import SwiftUI
import Combine

public struct ServerDrivenStarterView: View {
    
    @ObservedObject var viewModel: ViewModel
    let destination: String
    
    public init(destination: String) {
        self.destination = destination
        self.viewModel = ViewModel(service: DependecyContainer.shared.newInstance()!)
    }
    
    public var body: some View {
        NavigationView {
            ServerDrivenMainView(destination: destination)
        }
    }
}
