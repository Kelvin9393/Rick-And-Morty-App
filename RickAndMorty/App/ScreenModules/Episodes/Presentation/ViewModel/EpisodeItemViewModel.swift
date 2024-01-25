//
//  EpisodeItemViewModel.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 24/01/2024.
//

import Foundation

struct EpisodeItemViewModel {
    private(set) var episode: Episode

    var episodeNumber: String {
        "# \(episode.id)"
    }

    var name: String {
        episode.name
    }

    var airDate: String {
        episode.airDate
    }

    var seasonAndEpisode: String {
        episode.episode
    }
}
