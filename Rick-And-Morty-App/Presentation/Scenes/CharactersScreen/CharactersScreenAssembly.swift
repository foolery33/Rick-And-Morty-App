//
//  CharactersScreenAssembly.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 17.08.2023.
//

import Foundation

enum CharactersScreenAssembly {
    public static func make(
        with sceneDelegate: CharactersScreenSceneDelegate
    ) -> CharactersScreenViewController {
        let viewModel = CharactersScreenViewModelImpl(
            dependencies: .init(
                getCharactersUseCase: UseCaseProvider.instance.getCharactersUseCase
            )
        )
        viewModel.sceneDelegate = sceneDelegate

        let viewController = CharactersScreenViewController(viewModel: viewModel)
        return viewController
    }
}
