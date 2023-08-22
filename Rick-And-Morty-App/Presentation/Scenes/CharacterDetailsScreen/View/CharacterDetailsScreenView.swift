//
//  CharacterDetailsScreenView.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 19.08.2023.
//

import SwiftUI
import Kingfisher

struct CharacterDetailsScreenView<ViewModel>: View where ViewModel: CharacterDetailsScreenViewModel {

    // MARK: - Public Properties

    @ObservedObject public var viewModel: ViewModel

    // MARK: - Private Properties

    private let characterImageWidth: CGFloat = 148
    private let characterImageHeight: CGFloat = 148
    private let characterImageCornerRadius: CGFloat = 16

    // MARK: - Body

    var body: some View {
        ZStack {
            AppColors.midnightNavy.swiftUIColor.edgesIgnoringSafeArea(.all)
            VStack {
                NavigationBarView {
                    viewModel.goBackToCharactersScreen()
                }
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        KFImage(URL(string: viewModel.character.image))
                            .resizable()
                            .frame(
                                width: characterImageWidth,
                                height: characterImageHeight
                            )
                            .cornerRadius(characterImageCornerRadius)
                        Text(viewModel.character.name)
                            .font(Font(AppFonts.bold22))
                            .foregroundColor(AppColors.white.swiftUIColor)
                            .padding(.top, AppConstants.spacingHuge)
                            .multilineTextAlignment(.center)
                        Text(viewModel.character.status.rawValue)
                            .font(Font(AppFonts.medium16))
                            .foregroundColor(
                                viewModel.character.status.textColor
                            )
                            .padding(.top, AppConstants.spacingSmall)
                        CharacterInfoView(
                            characterInfo: .init(
                                species: viewModel.character.species.valueOrUnknown,
                                type: viewModel.character.type.valueOrUnknown,
                                gender: viewModel.character.gender.rawValue.valueOrUnknown
                            )
                        )
                        .padding(.top, AppConstants.spacingHuge)
                        CharacterOriginView(
                            origin: $viewModel.origin
                        )
                        .padding(.top, AppConstants.spacingHuge)
                        EpisodeListView(episodeList: $viewModel.episodeList) { episode in
                            return viewModel.formatEpisodeString(episode)
                        }
                        .padding(.top, AppConstants.spacingHuge)
                    }
                    .padding([.leading, .trailing], AppConstants.spacingHuge)
                }
            }
            SwiftUILoaderView()
                .opacity(
                    viewModel.isLoading ? 1 : 0
                )
        }
        .onAppear {
            viewModel.viewDidAppear()
        }
        .alert(isPresented: $viewModel.isAlertShowing) {
            Alert(title: Text(viewModel.errorType.errorTitle), message: Text(viewModel.error))
        }
    }
}

// MARK: - Preview

struct CharacterDetailsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailsScreenView(
            viewModel: CharacterDetailsScreenViewModelImpl(
                dependencies: .init(
                    character: .init(),
                    getLocationUseCase: UseCaseProvider.instance.getLocationUseCase,
                    getEpisodeUseCase: UseCaseProvider.instance.getEpisodeUseCase,
                    formatEpisodeStringUseCase: UseCaseProvider.instance.formatEpisodeStringUseCase
                )
            )
        )
    }
}
