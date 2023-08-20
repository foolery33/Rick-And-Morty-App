//
//  SceneDelegate.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 17.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    lazy var coordinator: Coordinator = {
        AppCoordinator(navigationController: rootViewController)
    }()

    let rootViewController: UINavigationController = .init()

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = .init(windowScene: windowScene)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()

        rootViewController.isNavigationBarHidden = true

        coordinator.start()
    }

}

