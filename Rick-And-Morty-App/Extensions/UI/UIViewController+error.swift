//
//  UIViewController+error.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 17.08.2023.
//

import UIKit

extension UIViewController {

    func showError(title: String, message: String) {
        showAlert(title, message)
    }

    private func showAlert(_ title: String, _ message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        let okAction = UIAlertAction(
            title: R.string.localizable.ok(),
            style: .default
        )

        alertController.addAction(okAction)

        present(alertController, animated: true)
    }
}

