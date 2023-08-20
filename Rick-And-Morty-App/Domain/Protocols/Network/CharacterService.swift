//
//  CharacterService.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

protocol CharacterService {
    func getCharacters(
        page: Int,
        completion: @escaping (
            (Result<PaginatedCharacterResponse, Error>) -> Void
        )
    )
}
