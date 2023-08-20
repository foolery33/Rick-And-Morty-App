//
//  Coordinator.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 17.08.2023.
//

import UIKit

public protocol Coordinator: AnyObject {

    // MARK: - Properties

    var rootViewController: UIViewController { get }

    var children: [Coordinator] { get }

    // MARK: - Methods

    func start()
}
