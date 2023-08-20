//
//  NetworkServiceProvider.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

final class NetworkServiceProvider {

    // MARK: - Instances

    lazy var characterService: CharacterService = {
        CharacterServiceImpl()
    }()

    lazy var locationService: LocationService = {
        LocationServiceImpl()
    }()

    lazy var episodeService: EpisodeService = {
        EpisodeServiceImpl()
    }()

}
