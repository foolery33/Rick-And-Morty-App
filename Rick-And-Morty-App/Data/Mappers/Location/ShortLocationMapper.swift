//
//  ShortLocationMapper.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

struct ShortLocationMapper: Mapper {
    typealias Domain = ShortLocationDomain
    typealias Response = ShortLocationResponse

    func call(_ response: ShortLocationResponse) -> ShortLocationDomain {
        return .init(
            name: response.name,
            url: response.url
        )
    }
}
