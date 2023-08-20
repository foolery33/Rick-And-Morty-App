//
//  GetEpisodeUseCase.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import Foundation

final class GetEpisodeUseCase {

    // MARK: - Private Properties

    private let episodeRepository: EpisodeRepository

    // MARK: - Init

    public init(
        episodeRepository: EpisodeRepository
    ) {
        self.episodeRepository = episodeRepository
    }

    // MARK: - UseCase

    public func invoke(
        url: String,
        completion: @escaping(
            (Result<EpisodeDomain, Error>) -> Void
        )
    ) {
        episodeRepository.getEpisode(
            url: url
        ) { result in
            switch result {
            case .success(let domain):
                completion(.success(domain))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
