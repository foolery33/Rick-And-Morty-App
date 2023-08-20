//
//  CharacterMapper.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

struct CharacterMapper: Mapper {
    typealias Domain = CharacterDomain
    typealias Response = CharacterResponse

    func call(_ response: CharacterResponse) -> CharacterDomain {
        return .init(
            id: response.id,
            name: response.name,
            status: StatusMapper().call(response.status),
            species: response.species,
            type: response.type,
            gender: GenderMapper().call(response.gender),
            origin: ShortLocationMapper().call(response.origin),
            location: ShortLocationMapper().call(response.location),
            image: response.image,
            episode: response.episode,
            created: response.created
        )
    }
}
