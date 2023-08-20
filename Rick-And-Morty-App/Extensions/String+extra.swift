//
//  String+extra.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import Foundation

extension String {
    var valueOrUnknown : String {
        return self.isEmpty  ? "unknown" : self
    }
}
