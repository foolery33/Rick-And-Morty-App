//
//  CharacterDetailsScreenErrorType.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import Foundation

enum CharacterDetailsScreenErrorType {
    case getLocation
    case getEpisode
}

extension CharacterDetailsScreenErrorType {
    var errorTitle: String {
        switch self {
        case .getLocation:
            return R.string.localizable.get_location_error()
        case .getEpisode:
            return R.string.localizable.get_episode_error()
        }
    }
}
