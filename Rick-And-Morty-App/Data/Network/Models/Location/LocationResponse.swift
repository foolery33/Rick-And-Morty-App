//
//  LocationResponse.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import Foundation

struct LocationResponse: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String

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
