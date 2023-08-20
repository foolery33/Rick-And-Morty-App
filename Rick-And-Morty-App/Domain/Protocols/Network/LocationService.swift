//
//  LocationService.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import Foundation

protocol LocationService {
    func getLocation(
        url: String,
        completion: @escaping (
            (Result<LocationResponse, Error>) -> Void
        )
    )
}
