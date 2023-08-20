//
//  UIColor+extra.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 19.08.2023.
//

import UIKit
import SwiftUI

extension UIColor {
    var swiftUIColor: Color {
        return Color.init(uiColor: self)
    }

    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
}
