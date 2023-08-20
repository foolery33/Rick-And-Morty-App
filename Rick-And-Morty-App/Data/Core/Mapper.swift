//
//  Mapper.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 18.08.2023.
//

protocol Mapper {
    associatedtype Domain
    associatedtype Response

    func call(_ response: Response) -> Domain
}
