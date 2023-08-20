//
//  GenderDomain.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

enum GenderDomain: String {
    case female
    case male
    case genderless
    case unknown
}

extension GenderDomain {
    var rawValue: String {
        switch self {
        case .female:
            return R.string.localizable.female()
        case .male:
            return R.string.localizable.male()
        case .genderless:
            return R.string.localizable.genderless()
        case .unknown:
            return R.string.localizable.unknown()
        }
    }
}
