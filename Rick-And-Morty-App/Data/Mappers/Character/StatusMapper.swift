//
//  StatusMapper.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

struct StatusMapper: Mapper {
    typealias Domain = StatusDomain
    typealias Response = StatusResponse

    func call(_ response: StatusResponse) -> StatusDomain {
        switch response {
        case .alive:
            return .alive
        case .dead:
            return .dead
        case .unknown:
            return .unknown
        }
    }
}
