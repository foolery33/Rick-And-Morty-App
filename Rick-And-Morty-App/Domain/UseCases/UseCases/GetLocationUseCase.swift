//
//  GetLocationUseCase.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import Foundation

final class GetLocationUseCase {

    // MARK: - Private Properties

    private let locationRepository: LocationRepository

    // MARK: - Init

    public init(
        locationRepository: LocationRepository
    ) {
        self.locationRepository = locationRepository
    }

    // MARK: - UseCase

    public func invoke(
        url: String,
        completion: @escaping(
            (Result<LocationDomain, Error>) -> Void
        )
    ) {
        locationRepository.getLocation(
            url: url
        ) { result in
            switch result {
            case .success(let domain):
                completion(.success(domain))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
