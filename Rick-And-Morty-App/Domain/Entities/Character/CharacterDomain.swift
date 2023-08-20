//
//  CharacterDomain.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

struct CharacterDomain: Equatable {
    let id: Int
    let name: String
    let status: StatusDomain
    let species: String
    let type: String
    let gender: GenderDomain
    let origin: ShortLocationDomain
    let location: ShortLocationDomain
    let image: String
    let episode: [String]
    let created: String

    init(
        id: Int,
        name: String,
        status: StatusDomain,
        species: String,
        type: String,
        gender: GenderDomain,
        origin: ShortLocationDomain,
        location: ShortLocationDomain,
        image: String,
        episode: [String],
        created: String
    ) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.created = created
    }

    init() {
        self.id = .init()
        self.name = .init()
        self.status = .unknown
        self.species = .init()
        self.type = .init()
        self.gender = .unknown
        self.origin = .init()
        self.location = .init()
        self.image = .init()
        self.episode = .init()
        self.created = .init()
    }
}
