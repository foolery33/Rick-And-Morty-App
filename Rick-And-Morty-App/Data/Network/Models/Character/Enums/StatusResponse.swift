//
//  StatusResponse.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

enum StatusResponse: String, Codable, CodingKey {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
