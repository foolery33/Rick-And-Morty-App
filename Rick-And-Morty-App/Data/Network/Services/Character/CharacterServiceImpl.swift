//
//  CharacterServiceImpl.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

final class CharacterServiceImpl: BaseNetworkService {
    let baseURL = "https://rickandmortyapi.com/api"
}

// MARK: - CharacterService

extension CharacterServiceImpl: CharacterService {
    func getCharacters(
        page: Int,
        completion: @escaping (
            (Result<PaginatedCharacterResponse, Error>) -> Void)
    ) {
        guard var url = URLComponents(string: "\(baseURL)/character") else { return }
        url.queryItems = [
            URLQueryItem(name: "page", value: String(page))
        ]

        guard let finalUrl = URL(string: url.string.orEmpty) else { return }

        let request = URLRequest(url: finalUrl)

        let session = URLSession.shared

        let task = session.dataTask(
            with: request
        ) { [weak self] data, response, error in
            if let data = data {
                guard let httpResponse = response as? HTTPURLResponse
                else { return }

                guard let result = self?.handlerResponse(
                    data: data,
                    outputModel: PaginatedCharacterResponse.self,
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
