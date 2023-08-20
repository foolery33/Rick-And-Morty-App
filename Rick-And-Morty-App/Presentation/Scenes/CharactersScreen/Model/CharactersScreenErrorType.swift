//
//  CharactersScreenErrorType.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import Foundation

enum CharactersScreenErrorType {
    case getCharacter
}

extension CharactersScreenErrorType {
    var errorTitle: String {
        switch self {
        case .getCharacter:
            return R.string.localizable.get_character_error()
        }
    }
}
