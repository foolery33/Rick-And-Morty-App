//
//  PageInfoDomain.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

struct PageInfoDomain: Equatable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?

    init(
        count: Int,
        pages: Int,
        next: String?,
        prev: String?
    ) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }

    init() {
        self.count = .init()
        self.pages = .init()
        self.next = .init()
        self.prev = .init()
    }
}
