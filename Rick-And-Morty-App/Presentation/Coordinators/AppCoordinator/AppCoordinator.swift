//
//  AppCoordinator.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 17.08.2023.
//

import UIKit

final class AppCoordinator: BaseNavigationCoordinator {

    // MARK: - Start

    override func start() {
        startCharactersFlow()
    }

    // MARK: - Private Methods

    private func startCharactersFlow() {
        let coordinator = CharactersCoordinator(navigationController: navigationController)

        add(child: coordinator)
        coordinator.start()
    }

}
