//
//  UseCaseProvider.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

final class UseCaseProvider {

    // MARK: - Singleton

    static let instance = UseCaseProvider()

    // MARK: - Private Properties

    private lazy var networkServiceProvider: NetworkServiceProvider = {
        .init()
    }()

    private lazy var repositoriesProvider: RepositoriesProvider = {
        .init(
            networkServiceProvider: networkServiceProvider
        )
    }()

    // MARK: - Instances

    lazy var getCharactersUseCase: GetCharactersUseCase = {
        .init(
            characterRepository: repositoriesProvider.characterRepository
        )
    }()

    lazy var getLocationUseCase: GetLocationUseCase = {
        .init(
            locationRepository: repositoriesProvider.locationRepository
        )
    }()

    lazy var getEpisodeUseCase: GetEpisodeUseCase = {
        .init(
            episodeRepository: repositoriesProvider.episodeRepository
        )
    }()

    lazy var formatEpisodeStringUseCase: FormatEpisodeStringUseCase = {
        .init()
    }()
    
}
