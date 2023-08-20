//
//  CharactersScreenViewModel.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 17.08.2023.
//

import Foundation

protocol CharactersScreenViewModel {

    // MARK: - Input

    func viewDidLoad()
    func goToCharacterDetailsScreen(character: CharacterDomain)
    func refreshCharacters()
    func getCharacterList() -> [CharacterDomain]
    func loadCharacters(page: Int)

    // MARK: - Output

    var isLoading: Dynamic<Bool> { get }
    var error: Dynamic<String> { get }
    var paginatedCharacters: Dynamic<PaginatedCharacterDomain> { get }
    var errorType: CharactersScreenErrorType { get }

}

final class CharactersScreenViewModelImpl: CharactersScreenViewModel {

    // MARK: - Public Properties

    public weak var sceneDelegate: CharactersScreenSceneDelegate?

    // MARK: - Private Properties

    private let dependencies: Dependencies

    private var characterList: [CharacterDomain] = .init()

    // MARK: - Init

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    // MARK: - Input

    public func viewDidLoad() {
        loadCharacters(page: 1)
    }

    public func goToCharacterDetailsScreen(character: CharacterDomain) {
        sceneDelegate?.goToCharacterDetailsScreen(character: character)
    }

    public func refreshCharacters() {
        loadCharacters(page: 1)
    }

    public func getCharacterList() -> [CharacterDomain] {
        return characterList
    }

    public func loadCharacters(page: Int) {
        guard paginatedCharacters.value == .init() ||
            (paginatedCharacters.value != .init() && page <= paginatedCharacters.value.info.pages)
        else {
            return
        }

        isLoading.value = true
        dependencies.getCharactersUseCase.invoke(
            page: page
        ) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading.value = false
                switch result {
                case .success(let domain):
                    self?.paginatedCharacters.value = domain
                    if page == 1 {
                        self?.characterList = domain.results
                    } else {
                        self?.characterList.append(contentsOf: domain.results)
                    }

                case .failure(let error):
                    self?.error.value = error.localizedDescription
                    self?.errorType = .getCharacter
                }
            }
        }
    }

    // MARK: - Output

    public var isLoading: Dynamic<Bool> = .init(.init())

    public var error: Dynamic<String> = .init(.init())

    public var paginatedCharacters: Dynamic<PaginatedCharacterDomain> = .init(.init())

    public var page: Dynamic<Int> = .init(1)

    public var errorType: CharactersScreenErrorType = .getCharacter

}

// MARK: - Nested Types

extension CharactersScreenViewModelImpl {
    struct Dependencies {
        let getCharactersUseCase: GetCharactersUseCase
    }
}
