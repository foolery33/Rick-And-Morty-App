//
//  EpisodeListView.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import SwiftUI

struct EpisodeListView: View {

    // MARK: - Public Properties

    @Binding public var episodeList: [EpisodeDomain]

    public var formatEpisodeString: ((String) -> String)?

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: AppConstants.spacingMedium) {
            Text(R.string.localizable.episodes())
                .font(Font(AppFonts.semibold17))
                .foregroundColor(AppColors.white.swiftUIColor)
            LazyVStack(spacing: AppConstants.spacingMedium) {
                ForEach(episodeList) { episode in
                    VStack(alignment: .leading, spacing: AppConstants.spacingMedium) {
                        Text(episode.name)
                            .font(Font(AppFonts.semibold17))
                            .foregroundColor(AppColors.white.swiftUIColor)
                        HStack {
                            Text(
                                (formatEpisodeString?(episode.episode))
                                    .orEmpty
                                    .valueOrUnknown
                            )
                            .font(Font(AppFonts.medium13))
                            .foregroundColor(AppColors.brightGreen.swiftUIColor)
                            Spacer()
                            Spacer()
                                .frame(width: Constants.textSpacing)
                            Text(episode.airDate)
                                .font(Font(AppFonts.medium12))
                                .foregroundColor(AppColors.darkGray.swiftUIColor)
                        }
                    }
                    .padding(.all, AppConstants.spacingMedium)
                    .background(
                        AppColors.darkCharcoal.swiftUIColor.cornerRadius(
                            Constants.backgroundCornerRadius
                        )
                    )
                }
            }
        }
    }
}

// MARK: - Preview

struct EpisodeListView_Previews: PreviewProvider {
    @State static private var episodeList: [EpisodeDomain] = [
        .init(
            id: .init(),
            name: "Pilot",
            airDate: "December 2, 2013",
            episode: "S01E01",
            characters: [],
            url: .init(),
            created: .init()
        )
    ]
    static var previews: some View {
        EpisodeListView(
            episodeList: $episodeList
        )
            .preferredColorScheme(.dark)
    }
}

// MARK: - Constants

private extension EpisodeListView {
    enum Constants {
        static let textSpacing: CGFloat = 16
        static let backgroundCornerRadius: CGFloat = 10
    }
}
