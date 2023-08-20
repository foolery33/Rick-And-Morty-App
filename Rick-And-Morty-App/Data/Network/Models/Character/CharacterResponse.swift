//
//  CharacterResponse.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

struct CharacterResponse: Codable {
    let id: Int
    let name: String
    let status: StatusResponse
    let species: String
    let type: String
    let gender: GenderResponse
    let origin: ShortLocationResponse
    let location: ShortLocationResponse
    let image: String
    let episode: [String]
    let created: String
}
