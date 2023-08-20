//
//  CharactersScreenView.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 17.08.2023.
//

import UIKit

final class CharactersScreenView: UIView {

    // MARK: - Views

    private let charactersLabel: UILabel = {
        $0.textColor = AppColors.white
        $0.font = AppFonts.bold28
        $0.text = R.string.localizable.characters()
        return $0
    }(UILabel())

    public lazy var charactersCollectionView: UICollectionView = {
        $0.backgroundColor = AppColors.clear
        $0.register(
            CharactersCollectionViewCell.self,
            forCellWithReuseIdentifier: CharactersCollectionViewCell.reuseIdentifier
        )
        $0.showsVerticalScrollIndicator = false

        $0.delegate = self
        $0.dataSource = self

        let refresher = UIRefreshControl()
        refresher.tintColor = AppColors.white
        refresher.addTarget(
            self,
            action: #selector(updateCollection),
            for: .valueChanged
        )
        $0.refreshControl = refresher
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()))

    // MARK: - Public Properties

    public var onRefresh: (() -> Void)?

    public var onCharacterTapped: ((CharacterDomain) -> Void)?

    public var getCharacterList: (() -> [CharacterDomain])?

    public var loadMoreCharacters: ((Int) -> Void)?

    // MARK: - Private Properties

    private var page: Int = 1

    // MARK: - Inits

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    public func reloadCharactersCollectionView() {
        charactersCollectionView.reloadData()
    }

    public func stopRefreshing() {
        DispatchQueue.main.async {
            self.charactersCollectionView.refreshControl?.endRefreshing()
        }
    }
    
    // MARK: - Private Methods

    private func setup() {
        configure()
        setupSubviews()
        configureConstraints()
    }

    private func configure() {
        backgroundColor = AppColors.midnightNavy
    }

    private func setupSubviews() {
        addSubviews(
            charactersLabel,
            charactersCollectionView
        )
    }

    private func configureConstraints() {
        charactersLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            charactersLabel.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: AppConstants.spacingMedium
            ),
            charactersLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: AppConstants.spacingHuge
            ),
            charactersLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -AppConstants.spacingHuge
            )
        ])

        charactersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            charactersCollectionView.topAnchor.constraint(
                equalTo: charactersLabel.bottomAnchor,
                constant: AppConstants.spacingHuge
            ),
            charactersCollectionView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: AppConstants.spacingHuge
            ),
            charactersCollectionView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -AppConstants.spacingHuge
            ),
            charactersCollectionView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: .zero
            )
        ])
    }

    // MARK: - Actions

    @objc
    private func updateCollection() {
        page = 1
        onRefresh?()
    }

}

// MARK: - UICollectionViewDataSource

extension CharactersScreenView: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return (getCharacterList?().count).orZero
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = charactersCollectionView.dequeueReusableCell(
            withReuseIdentifier: CharactersCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? CharactersCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.configure(with: getCharacterList?()[indexPath.row] ?? .init())
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CharactersScreenView: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        onCharacterTapped?(
            (getCharacterList?())
                .orEmptyArray()[indexPath.row]
        )
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row >= page * Constants.charactersOnPageCountMinusOne {
            page += 1
            loadMoreCharacters?(page)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CharactersScreenView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return collectionView.getSizeOfCell(
            insetsCollectionView: .zero,
            itemSpaceCollectionView: AppConstants.spacingMedium,
            itemsInRowCollectionView: Constants.charactersInRowCount,
            percentageOfHeightToWidthCell: (
                Constants.characterCellHeight / Constants.characterCellWidth
            ) * 100
        )
    }
}

// MARK: - Constants

private extension CharactersScreenView {
    enum Constants {
        static let charactersInRowCount: Int = 2
        static let characterCellHeight: CGFloat = 202
        static let characterCellWidth: CGFloat = 156

        static let charactersOnPageCountMinusOne: Int = 19
    }
}
