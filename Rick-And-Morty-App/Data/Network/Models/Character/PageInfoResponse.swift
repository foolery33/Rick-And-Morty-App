//
//  PageInfoResponse.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

struct PageInfoResponse: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
