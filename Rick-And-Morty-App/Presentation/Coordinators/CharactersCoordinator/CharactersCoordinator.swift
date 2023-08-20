//
//  CharactersCoordinator.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 17.08.2023.
//

import Foundation

final class CharactersCoordinator: BaseNavigationCoordinator {

    // MARK: - Start

    override func start() {
        startCharactersScreen()
    }

    // MARK: - Private Methods

    private func startCharactersScreen() {
        let viewController = CharactersScreenAssembly.make(with: self)
        navigationController.pushViewController(viewController, animated: true)
    }

    private func startCharacterDetailsScreen(character: CharacterDomain) {
        let viewController = CharacterDetailsScreenAssembly.make(
            with: self,
            character: character
        )
        navigationController.pushViewController(viewController, animated: true)
    }

    func returnFromScreen() {
        navigationController.popViewController(animated: true)
    }

}

// MARK: - CharactersScreenSceneDelegate

extension CharactersCoordinator: CharactersScreenSceneDelegate {
    func goToCharacterDetailsScreen(character: CharacterDomain) {
        startCharacterDetailsScreen(character: character)
    }
}

// MARK: - CharacterDetailsScreenSceneDelegate

extension CharactersCoordinator: CharacterDetailsScreenSceneDelegate {
    func goBackToCharactersScreen() {
        returnFromScreen()
    }
}
