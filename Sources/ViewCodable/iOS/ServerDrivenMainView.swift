//
//  File.swift
//  
//
//  Created by Mateus Forgiarini on 6/30/21.
//

import Combine
import SwiftUI

struct ServerDrivenMainView<T: ServerDrivenViewModel>: View {
    
    @ObservedObject var viewModel: T
    var destination: String
    
    var body: some View {
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
