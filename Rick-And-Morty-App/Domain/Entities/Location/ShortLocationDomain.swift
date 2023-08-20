//
//  ShortLocationDomain.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

struct ShortLocationDomain: Equatable {
    let name: String
    let url: String

    init(
        name: String,
        url: String
    ) {
        self.name = name
        self.url = url
    }

    init() {
        self.name = .init()
        self.url = .init()
    }
}
