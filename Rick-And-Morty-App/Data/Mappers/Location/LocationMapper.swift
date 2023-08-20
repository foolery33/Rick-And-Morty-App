//
//  LocationMapper.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import Foundation

struct LocationMapper: Mapper {
    typealias Domain = LocationDomain
    typealias Response = LocationResponse

    func call(_ response: LocationResponse) -> LocationDomain {
        return .init(
            id: response.id,
            name: response.name,
            type: response.type,
            dimension: response.dimension,
            residents: response.residents,
            url: response.url,
            created: response.created
        )
    }
}
