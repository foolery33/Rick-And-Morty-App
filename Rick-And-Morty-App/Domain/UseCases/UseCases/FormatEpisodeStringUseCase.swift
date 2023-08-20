//
//  FormatEpisodeStringUseCase.swift
//  Rick-And-Morty-App
//
//  Created by Nikita Usov on 20.08.2023.
//

import Foundation

final class FormatEpisodeStringUseCase {

    // MARK: - UseCase

    public func invoke(_ episode: String) -> String {
        let pattern = #"S(\d+)E(\d+)"#
        let regex = try! NSRegularExpression(pattern: pattern)

        var result = ""

        if let match = regex.firstMatch(
            in: episode,
            options: [],
            range: NSRange(episode.startIndex..., in: episode)
        ) {
            if let seasonRange = Range(match.range(at: 1), in: episode),
               let episodeRange = Range(match.range(at: 2), in: episode) {
                let season = String(episode[seasonRange])
                let episode = String(episode[episodeRange])

                result = "\(R.string.localizable.episode_with_number(String(Int(episode).orZero))), " +
                         "\(R.string.localizable.season_with_number(String(Int(season).orZero)))"
            }
        }

        return result.valueOrUnknown
    }
}
