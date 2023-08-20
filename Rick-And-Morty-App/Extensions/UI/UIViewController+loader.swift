//
//  UIViewController+loader.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 17.08.2023.
//

import UIKit

extension UIViewController {

    private var loaderTag: Int { 198765 }

    func setLoaderVisible(_ value: Bool) {
        if value {
            showLoader()
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.hideLoader()
            }
        }
    }

    private func showLoader() {
        guard let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first,
              window.subviews.first(where: { $0.tag == loaderTag }) == nil
        else {
            return
        }

        let loaderView = UIKitLoaderView()
        loaderView.tag = loaderTag

        window.addSubview(loaderView)
        loaderView.tag = loaderTag

        window.addSubview(loaderView)
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loaderView.topAnchor.constraint(equalTo: window.topAnchor),
            loaderView.bottomAnchor.constraint(equalTo: window.bottomAnchor),
            loaderView.leadingAnchor.constraint(equalTo: window.leadingAnchor),
            loaderView.trailingAnchor.constraint(equalTo: window.trailingAnchor),
        ])
    }

    private func hideLoader() {
        guard let loaderView = UIApplication
            .shared
            .windows
            .filter({ $0.isKeyWindow })
            .first?
            .subviews
            .first(where: { $0.tag == loaderTag })
        else {
            return
        }

        loaderView.removeFromSuperview()
    }
}
