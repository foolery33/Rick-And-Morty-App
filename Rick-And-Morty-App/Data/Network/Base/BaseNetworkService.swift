//
//  BaseNetworkService.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

class BaseNetworkService {
    private let jsonDecoder = JSONDecoder()

    func handlerResponse<T>(
        data: Data,
        outputModel: T.Type,
        statusCode: Int
    ) -> Result<T, Error> where T: Decodable {
        guard statusCode < 400
        else {
            return .failure(
                makePresentationError(
                    statusCode: statusCode,
                    data: data
                )
            )
        }

        guard let output = try? jsonDecoder.decode(outputModel.self, from: data)
        else {
            return .failure(AppError.dataMapping)
        }

        return .success(output)
    }

    private func makePresentationError(statusCode: Int, data: Data) -> Error {
        switch statusCode {
        case 403:
            return AppError.security

        case 422:
            return AppError.validation

        case 400 ... 499:
            guard let simpleApiError = try? jsonDecoder
                    .decode(SimpleApiError.self, from: data)
            else {
                return AppError.unknown
            }

            return AppError.message(simpleApiError.error)

        case 500 ... 599:
            return AppError.server(nil)

        default:
            return AppError.unknown
        }
    }
}
