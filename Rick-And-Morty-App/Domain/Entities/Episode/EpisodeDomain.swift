//
//  EpisodeDomain.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import Foundation

struct EpisodeDomain: Identifiable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
