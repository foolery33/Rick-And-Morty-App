//
//  EpisodeRepository.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import Foundation

protocol EpisodeRepository {
    func getEpisode(
        url: String,
        completion: @escaping (
            (Result<EpisodeDomain, Error>) -> Void
        )
    )
}
