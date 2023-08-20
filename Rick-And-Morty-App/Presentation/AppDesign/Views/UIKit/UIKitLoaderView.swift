//
//  UIKitLoaderView.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 17.08.2023.
//

import UIKit

final class UIKitLoaderView: UIView {

    // MARK: - Views

    private let view = UIView()

    private let activityIndicator = UIActivityIndicatorView()

    // MARK: - Inits

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Private Methods

    private func setup() {
        view.backgroundColor = AppColors.midnightNavy.withAlphaComponent(
            Constants.loaderViewBackgroundOpacity
        )
        view.layer.cornerRadius = Constants.loaderViewCornerRadius

        activityIndicator.startAnimating()
        activityIndicator.color = AppColors.white

        view.addSubview(activityIndicator)
        addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(
                equalToConstant: Constants.loaderViewSize
            ),
            view.heightAnchor.constraint(
                equalToConstant: Constants.loaderViewSize
            ),
            view.centerXAnchor.constraint(
                equalTo: centerXAnchor
            ),
            view.centerYAnchor.constraint(
                equalTo: centerYAnchor
            )
        ])

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            activityIndicator.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            activityIndicator.widthAnchor.constraint(equalToConstant: Constants.loaderViewSize),
            activityIndicator.heightAnchor.constraint(equalToConstant: Constants.loaderViewSize)
        ])
    }

}

// MARK: - Constants

extension UIKitLoaderView {
    enum Constants {
        static let loaderViewCornerRadius: CGFloat = 8
        static let loaderViewBackgroundOpacity: CGFloat = 0.5
        static let loaderViewSize: CGFloat = 55
    }
}
