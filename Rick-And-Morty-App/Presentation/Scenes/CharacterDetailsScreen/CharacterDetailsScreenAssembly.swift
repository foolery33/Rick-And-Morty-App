//
//  CharacterDetailsScreenAssembly.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 19.08.2023.
//

import SwiftUI

enum CharacterDetailsScreenAssembly {
    static func make(
        with sceneDelegate: CharacterDetailsScreenSceneDelegate,
        character: CharacterDomain
    ) -> UIHostingController<CharacterDetailsScreenView<CharacterDetailsScreenViewModelImpl>> {
        let viewModel = CharacterDetailsScreenViewModelImpl(
            dependencies: .init(
                character: character,
                getLocationUseCase: UseCaseProvider.instance.getLocationUseCase,
                getEpisodeUseCase: UseCaseProvider.instance.getEpisodeUseCase,
                formatEpisodeStringUseCase: UseCaseProvider.instance.formatEpisodeStringUseCase
            )
        )
        viewModel.sceneDelegate = sceneDelegate

        let viewController = UIHostingController(
            rootView: CharacterDetailsScreenView(
                viewModel: viewModel
            )
        )
        return viewController
    }
}
