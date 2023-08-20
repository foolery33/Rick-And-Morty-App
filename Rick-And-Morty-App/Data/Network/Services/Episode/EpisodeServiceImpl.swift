//
//  EpisodeServiceImpl.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import Foundation

final class EpisodeServiceImpl: BaseNetworkService, EpisodeService {
    func getEpisode(
        url: String,
        completion: @escaping (
            (Result<EpisodeResponse, Error>) -> Void
        )
    ) {
        guard let url = URL(string: url) else { return }

        let request = URLRequest(url: url)

        let session = URLSession.shared

        let task = session.dataTask(
            with: request
        ) { [weak self] data, response, error in
            if let data = data {
                guard let httpResponse = response as? HTTPURLResponse
                else { return }

                guard let result = self?.handlerResponse(
                    data: data,
                    outputModel: EpisodeResponse.self,
                    statusCode: httpResponse.statusCode
                ) else {
                    return
                }

                switch result {
                case .success(let response):
                    completion(.success(response))

                case .failure(let error):
                    completion(.failure(error))
                }
            } else {
                completion(.failure(AppError.unknown))
            }
        }

        task.resume()
    }
}
