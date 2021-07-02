//
//  ImageEncodable.swift
//  
//
//  Created by Mateus Forgiarini on 10/26/20.
//

import SwiftUI
import Combine
#if os(iOS)
import UIKit
#else
import AppKit
#endif

public struct ImageCodable: ServerDrivenView {
    
    public var navigationTitle: String?
    public var destination: String?
    public var url: String
    
    public init(url: String) {
        self.url = url
    }
    
    public var body: some View {
        ImageView(withURL: url)
    }
}

private class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}

private struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    
    #if os(iOS)
    @State var image: UIImage = UIImage()
    #else
    @State var image: NSImage = NSImage()
    #endif
    
    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }
    
    var body: some View {
        #if os(iOS)
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
            }
        #else
        Image(nsImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .onReceive(imageLoader.didChange) { data in
                self.image = NSImage(data: data) ?? NSImage()
            }
        #endif
    }
}

