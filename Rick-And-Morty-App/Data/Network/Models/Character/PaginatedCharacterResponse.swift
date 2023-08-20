//
//  PaginatedCharacterResponse.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

struct PaginatedCharacterResponse: Codable {
    let info: PageInfoResponse
    let results: [CharacterResponse]
}
