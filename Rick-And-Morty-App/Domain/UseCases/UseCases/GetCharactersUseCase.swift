//
//  GetCharactersUseCase.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

final class GetCharactersUseCase {

    // MARK: - Private Properties

    private let characterRepository: CharacterRepository

    // MARK: - Init

    public init(
        characterRepository: CharacterRepository
    ) {
        self.characterRepository = characterRepository
    }

    // MARK: - UseCase

    public func invoke(
        page: Int,
        completion: @escaping(
            (Result<PaginatedCharacterDomain, Error>) -> Void
        )
    ) {
        characterRepository.getCharacters(
            page: page
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
