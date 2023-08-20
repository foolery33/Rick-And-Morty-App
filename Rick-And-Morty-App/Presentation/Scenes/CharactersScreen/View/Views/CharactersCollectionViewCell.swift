//
//  CharactersCollectionViewCell.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 17.08.2023.
//

import UIKit
import Kingfisher

final class CharactersCollectionViewCell: UICollectionViewCell {

    // MARK: - Views

    private let characterImageView: UIImageView = {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.cornerRadius = Constants.characterImageViewCornerRadius
        return $0
    }(UIImageView())

    private let characterNameLabel: UILabel = {
        $0.textColor = AppColors.white
        $0.textAlignment = .center
        $0.font = AppFonts.semibold17
        return $0
    }(UILabel())

    // MARK: - Inits

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    public func configure(with character: CharacterDomain) {
        if let url = URL(string: character.image) {
            DispatchQueue.main.async {
                self.characterImageView.kf.setImage(with: url)
            }
        }
        characterNameLabel.text = character.name
    }

    // MARK: - Private Methods

    private func setup() {
        configure()
        setupSubviews()
        configureConstraints()
    }

    private func configure() {
        backgroundColor = AppColors.darkCharcoal
        layer.cornerRadius = Constants.cellCornerRadius
    }

    private func setupSubviews() {
        contentView.addSubviews(
            characterImageView,
            characterNameLabel
        )
    }

    private func configureConstraints() {
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: AppConstants.spacingSmall
            ),
            characterImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: AppConstants.spacingSmall
            ),
            characterImageView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -AppConstants.spacingSmall
            ),
            characterImageView.bottomAnchor.constraint(
                equalTo: characterNameLabel.topAnchor,
                constant: -AppConstants.spacingMedium
            )
        ])

        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterNameLabel.topAnchor.constraint(
                equalTo: characterImageView.bottomAnchor,
                constant: AppConstants.spacingMedium
            ),
            characterNameLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor, constant: -AppConstants.spacingMedium
            ),
            characterNameLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: AppConstants.spacingTiny
            ),
            characterNameLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -AppConstants.spacingTiny
            )
        ])
    }
}

// MARK: - Constants

private extension CharactersCollectionViewCell {
    enum Constants {
        static let characterImageViewCornerRadius: CGFloat = 10
        static let cellCornerRadius: CGFloat = 16
    }
}
