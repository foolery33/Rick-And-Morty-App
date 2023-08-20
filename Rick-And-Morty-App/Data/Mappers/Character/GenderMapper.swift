//
//  GenderMapper.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

struct GenderMapper: Mapper {
    typealias Domain = GenderDomain
    typealias Response = GenderResponse

    func call(_ response: GenderResponse) -> GenderDomain {
        switch response {
        case .female:
            return .female
        case .male:
            return .male
        case .genderless:
            return .genderless
        case .unknown:
            return .unknown
        }
    }
}
