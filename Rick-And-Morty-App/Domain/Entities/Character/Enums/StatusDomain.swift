//
//  StatusDomain.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation
import SwiftUI

enum StatusDomain: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

extension StatusDomain {
    var textColor: Color {
        switch self {
        case .alive:
            return AppColors.brightGreen.swiftUIColor
        case .dead:
            return AppColors.brightRed.swiftUIColor
        case .unknown:
            return AppColors.gray.swiftUIColor
        }
    }
}
