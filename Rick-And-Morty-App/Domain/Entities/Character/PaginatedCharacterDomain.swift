//
//  PaginatedCharacterDomain.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

struct PaginatedCharacterDomain: Equatable {
    let info: PageInfoDomain
    let results: [CharacterDomain]

    init(
        info: PageInfoDomain,
        results: [CharacterDomain]
    ) {
        self.info = info
        self.results = results
    }

    init() {
        self.info = .init()
        self.results = .init()
    }
}
