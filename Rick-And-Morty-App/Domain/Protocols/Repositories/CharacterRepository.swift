//
//  CharacterRepository.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

protocol CharacterRepository {
    func getCharacters(
        page: Int,
        completion: @escaping (
            (Result<PaginatedCharacterDomain, Error>) -> Void
        )
    )
}
