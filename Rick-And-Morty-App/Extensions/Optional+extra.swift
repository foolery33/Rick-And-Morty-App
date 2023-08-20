//
//  Optional+extra.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

extension Optional {
    func orEmptyArray<T>() -> [T] where Wrapped == [T] {
        return self ?? []
    }
}

extension Optional where Wrapped == String {
    var orEmpty: String {
        return self ?? ""
    }
}

extension Optional where Wrapped == Int {
    var orZero: Int {
        return self ?? .zero
    }
}
