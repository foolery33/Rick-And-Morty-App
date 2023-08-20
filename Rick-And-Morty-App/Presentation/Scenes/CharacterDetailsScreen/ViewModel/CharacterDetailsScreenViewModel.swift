//
//  CharacterDetailsScreenViewModel.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 19.08.2023.
//

import Foundation

protocol CharacterDetailsScreenViewModel: ObservableObject {

    // MARK: - Input

    var character: CharacterDomain { get }
    func viewDidAppear()
    func goBackToCharactersScreen()
    func getLocation(url: String)
    func getEpisode(url: String)
    func formatEpisodeString(_ episode: String) -> String

    // MARK: - Output

    var origin: LocationDomain { get set }
    var episodeList: [EpisodeDomain] { get set }
    var isAlertShowing: Bool { get set }
    var error: String { get }
    var errorType: CharacterDetailsScreenErrorType { get }
    var isLoading: Bool { get }

}

final class CharacterDetailsScreenViewModelImpl: CharacterDetailsScreenViewModel {

    // MARK: - Public Properties

    public weak var sceneDelegate: CharacterDetailsScreenSceneDelegate?

    // MARK: - Private Properties

    private let dependencies: Dependencies

    private let dispatchGroup: DispatchGroup = .init()

    // MARK: - Init

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    // MARK: - Input

    public var character: CharacterDomain {
        dependencies.character
    }

    public func viewDidAppear() {
        isLoading = true

        getLocation(url: character.origin.url)
        getEpisodeList()

        dispatchGroup.notify(queue: .main) {
            self.isLoading = false
        }
    }

    public func goBackToCharactersScreen() {
        sceneDelegate?.goBackToCharactersScreen()
    }

    public func getLocation(url: String) {
        dispatchGroup.enter()
        dependencies.getLocationUseCase.invoke(url: url) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let domain):
                    self?.origin = domain
                case .failure(let error):
                    self?.error = error.localizedDescription
                    self?.isAlertShowing = true
                    self?.errorType = .getLocation
                }
                self?.dispatchGroup.leave()
            }
        }
    }

    public func getEpisode(url: String) {
        dispatchGroup.enter()
        dependencies.getEpisodeUseCase.invoke(url: url) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let domain):
                    self?.episodeList.append(domain)
                case .failure(let error):
                    self?.error = error.localizedDescription
                    self?.isAlertShowing = true
                    self?.errorType = .getEpisode
                }
                self?.dispatchGroup.leave()
            }
        }
    }

    public func formatEpisodeString(_ episode: String) -> String {
        return dependencies.formatEpisodeStringUseCase.invoke(episode)
    }

    // MARK: - Output

    @Published public var origin: LocationDomain = .init()

    @Published public var episodeList: [EpisodeDomain] = .init()

    @Published public var isAlertShowing: Bool = .init()

    @Published public var error: String = .init()

    @Published public var errorType: CharacterDetailsScreenErrorType = .getEpisode

    @Published public var isLoading: Bool = .init()

    // MARK: - Private Methods

    private func getEpisodeList() {
        for episode in character.episode {
            getEpisode(url: episode)
        }
    }

}

// MARK: - Nested Types

extension CharacterDetailsScreenViewModelImpl {
    struct Dependencies {
        let character: CharacterDomain
        let getLocationUseCase: GetLocationUseCase
        let getEpisodeUseCase: GetEpisodeUseCase
        let formatEpisodeStringUseCase: FormatEpisodeStringUseCase
    }
}

