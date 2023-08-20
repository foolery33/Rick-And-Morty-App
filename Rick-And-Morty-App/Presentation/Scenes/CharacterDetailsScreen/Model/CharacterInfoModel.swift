//
//  CharacterInfoModel.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import Foundation

struct CharacterInfoModel: Identifiable {
    let id: UUID = .init()
    let species: String
    let type: String
    let gender: String
}
