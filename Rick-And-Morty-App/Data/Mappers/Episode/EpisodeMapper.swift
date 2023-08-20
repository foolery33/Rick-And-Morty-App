//
//  EpisodeMapper.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import Foundation

struct EpisodeMapper: Mapper {
    typealias Domain = EpisodeDomain
    typealias Response = EpisodeResponse

    func call(_ response: EpisodeResponse) -> EpisodeDomain {
        .init(
            id: response.id,
            name: response.name,
            airDate: response.airDate,
            episode: response.episode,
            characters: response.characters,
            url: response.url,
            created: response.created
        )
    }
}
