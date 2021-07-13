//
//  SceneDelegate.swift
//  SwiftUIServerDrivenUI
//
//  Created by Mateus Forgiarini on 10/3/20.
//  Copyright © 2020 Mateus Forgiarini da Silva. All rights reserved.
//

import UIKit
import SwiftUI
import ViewCodable

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        DependecyContainer.shared.register(instance: HomeService())
        let contentView = ServerDrivenStarterView(destination: "home")

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}

