//
//  LocationRepositoryImpl.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import Foundation

final class LocationRepositoryImpl {

    // MARK: - Private Properties

    private let locationService: LocationService

    private let locationMapper: LocationMapper

    // MARK: - Init

    public init(
        locationService: LocationService,
        locationMapper: LocationMapper
    ) {
        self.locationService = locationService
        self.locationMapper = locationMapper
    }

}

// MARK: - LocationRepository

extension LocationRepositoryImpl: LocationRepository {
    func getLocation(
        url: String,
        completion: @escaping (
            (Result<LocationDomain, Error>) -> Void
        )
    ) {
        locationService.getLocation(
            url: url
        ) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                completion(
                    .success(
                        self.locationMapper.call(
                            response
                        )
                    )
                )

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
