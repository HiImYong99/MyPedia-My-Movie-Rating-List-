//
//  SceneDelegate.swift
//  MyPedia
//
//  Created by 김용태 on 2023/02/08.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windonScene = (scene as? UIWindowScene) else {return}
              
              window = UIWindow(windowScene: windonScene) // or window?.windowScene = windonScene
              
              let rootVC = MainScreen()
              let navVC = UINavigationController(rootViewController: rootVC)
              
              self.window?.rootViewController = navVC
              window?.makeKeyAndVisible()
    }



}

