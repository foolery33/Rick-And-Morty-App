//
//  RepositoriesProvider.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

final class RepositoriesProvider {

    // MARK: - Private Properties

    private let networkServiceProvider: NetworkServiceProvider

    // MARK: - Init

    public init(
        networkServiceProvider: NetworkServiceProvider
    ) {
        self.networkServiceProvider = networkServiceProvider
    }

    // MARK: - Instances

    lazy var characterRepository: CharacterRepository = {
        CharacterRepositoryImpl(
            characterService: networkServiceProvider.characterService,
            paginatedCharacterMapper: .init()
        )
    }()

    lazy var locationRepository: LocationRepository = {
        LocationRepositoryImpl(
            locationService: networkServiceProvider.locationService,
            locationMapper: .init()
        )
    }()

    lazy var episodeRepository: EpisodeRepository = {
        EpisodeRepositoryImpl(
            episodeService: networkServiceProvider.episodeService,
            episodeMapper: .init()
        )
    }()

}
