//
//  LocationDomain.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import Foundation

struct LocationDomain {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String

    init(
        id: Int,
        name: String,
        type: String,
        dimension: String,
        residents: [String],
        url: String,
        created: String
    ) {
        self.id = id
        self.name = name
        self.type = type
        self.dimension = dimension
        self.residents = residents
        self.url = url
        self.created = created
    }

    init() {
        self.id = .init()
        self.name = .init()
        self.type = .init()
        self.dimension = .init()
        self.residents = .init()
        self.url = .init()
        self.created = .init()
    }
}
