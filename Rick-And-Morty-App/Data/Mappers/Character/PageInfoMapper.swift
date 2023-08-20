//
//  PageInfoMapper.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

import Foundation

struct PageInfoMapper: Mapper {
    typealias Domain = PageInfoDomain
    typealias Response = PageInfoResponse
    
    func call(_ response: PageInfoResponse) -> PageInfoDomain {
        return .init(
            count: response.count,
            pages: response.pages,
            next: response.next,
            prev: response.prev
        )
    }
}
