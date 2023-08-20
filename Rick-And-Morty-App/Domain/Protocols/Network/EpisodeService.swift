//
//  EpisodeService.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import Foundation

protocol EpisodeService {
    func getEpisode(
        url: String,
        completion: @escaping (
            (Result<EpisodeResponse, Error>) -> Void
        )
    )
}
