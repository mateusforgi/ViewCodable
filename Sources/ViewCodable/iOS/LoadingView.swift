//
//  File.swift
//  
//
//  Created by Mateus Forgiarini on 6/30/21.
//

import SwiftUI
struct LoadingView: View {
    var destination: String?
    
    var body: some View {
        #if os(iOS)
        if #available(iOS 14.0, *) {
            ProgressView()
        } else {
            ActivityIndicator(style: .large)
        }
        #else
        Spacer()
        #endif
    }
}

#if os(iOS)
struct ActivityIndicator: UIViewRepresentable {
    
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.startAnimating()
    }
}
#endif
