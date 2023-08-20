//
//  PaginatedCharacterMapper.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

struct PaginatedCharacterMapper: Mapper {
    typealias Domain = PaginatedCharacterDomain
    typealias Response = PaginatedCharacterResponse

    func call(_ response: PaginatedCharacterResponse) -> PaginatedCharacterDomain {
        return .init(
            info: PageInfoMapper().call(response.info),
            results: response.results.map {
                CharacterMapper().call($0)
            }
        )
    }
}
