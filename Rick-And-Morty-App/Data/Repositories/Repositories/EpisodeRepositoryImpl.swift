//
//  EpisodeRepositoryImpl.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import Foundation

final class EpisodeRepositoryImpl {

    // MARK: - Private Properties

    private let episodeService: EpisodeService

    private let episodeMapper: EpisodeMapper

    // MARK: - Init

    public init(
        episodeService: EpisodeService,
        episodeMapper: EpisodeMapper
    ) {
        self.episodeService = episodeService
        self.episodeMapper = episodeMapper
    }

}

// MARK: - LocationRepository

extension EpisodeRepositoryImpl: EpisodeRepository {
    func getEpisode(
        url: String,
        completion: @escaping (
            (Result<EpisodeDomain, Error>) -> Void
        )
    ) {
        episodeService.getEpisode(
            url: url
        ) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                completion(
                    .success(
                        self.episodeMapper.call(
                            response
                        )
                    )
                )

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
