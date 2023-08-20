//
//  CharactersScreenSceneDelegate.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 17.08.2023.
//

import Foundation

protocol CharactersScreenSceneDelegate: AnyObject {
    func goToCharacterDetailsScreen(character: CharacterDomain)
}
