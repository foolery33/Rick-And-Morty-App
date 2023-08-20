//
//  CharactersScreenViewController.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 17.08.2023.
//

import UIKit

final class CharactersScreenViewController: UIViewController {

    // MARK: - Private Properties

    private let viewModel: CharactersScreenViewModel

    private let customView: CharactersScreenView = .init()

    // MARK: - Inits

    public init(viewModel: CharactersScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Private Methods

    private func setup() {
        viewModel.viewDidLoad()
        setupBindings()
    }

    private func setupBindings() {
        viewModel.isLoading.bind { [weak self] isLoading in
            self?.setLoaderVisible(isLoading)
        }

        // TODO: Заменить 'error' на что-то конкретное
        viewModel.error.bind { [weak self] error in
            self?.showError(
                title: (self?.viewModel.errorType.errorTitle).orEmpty,
                message: error
            )
        }

        viewModel.paginatedCharacters.bind { [weak self] paginatedCharacters in
            self?.customView.reloadCharactersCollectionView()
        }

        customView.onRefresh = { [weak self] in
            self?.viewModel.refreshCharacters()
            self?.customView.stopRefreshing()
        }

        customView.onCharacterTapped = { [weak self] character in
            self?.viewModel.goToCharacterDetailsScreen(
                character: character
            )
        }

        customView.getCharacterList = { [weak self] in
            (self?.viewModel.getCharacterList()).orEmptyArray()
        }

        customView.loadMoreCharacters = { [weak self] page in
            self?.viewModel.loadCharacters(page: page)
        }
    }

}
