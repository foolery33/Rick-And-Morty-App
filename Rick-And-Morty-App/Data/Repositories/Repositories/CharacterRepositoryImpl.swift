//
//  CharacterRepositoryImpl.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

final class CharacterRepositoryImpl {

    // MARK: - Private Properties

    private let characterService: CharacterService
    
    private let paginatedCharacterMapper: PaginatedCharacterMapper

    // MARK: - Init

    public init(
        characterService: CharacterService,
        paginatedCharacterMapper: PaginatedCharacterMapper
    ) {
        self.characterService = characterService
        self.paginatedCharacterMapper = paginatedCharacterMapper
    }

}

// MARK: - CharacterRepository

extension CharacterRepositoryImpl: CharacterRepository {
    func getCharacters(
        page: Int,
        completion: @escaping (
            (Result<PaginatedCharacterDomain, Error>) -> Void
        )
    ) {
        characterService.getCharacters(
            page: page
        ) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                completion(
                    .success(
                        self.paginatedCharacterMapper.call(
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
