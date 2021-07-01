//
//  File.swift
//  
//
//  Created by Mateus Forgiarini on 6/30/21.
//

import SwiftUI
import Combine

struct ServerDrivenStarterView<T: ServerDrivenViewModel>: View {
    
    @ObservedObject var viewModel: T
    var destination: String
    
    var body: some View {
        NavigationView {
            ServerDrivenMainView(viewModel: viewModel, destination: destination)
        }
    }
}
