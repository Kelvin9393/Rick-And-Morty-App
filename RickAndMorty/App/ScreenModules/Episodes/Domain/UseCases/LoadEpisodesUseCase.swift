//
//  LoadEpisodesUseCase.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 23/01/2024.
//

import Foundation

protocol LoadEpisodesUseCase {
    mutating func getEpisodes() async -> Result<[Episode], Error>
}

struct LoadEpisodesUseCaseImp: LoadEpisodesUseCase {
    private let episodesRepository: EpisodesRepository
    private var urlEpisodes: String

    init(
        episodesRepository: EpisodesRepository,
        urlEpisodes: String
    ) {
        self.episodesRepository = episodesRepository
        self.urlEpisodes = urlEpisodes
    }

    mutating func getEpisodes() async -> Result<[Episode], Error> {
        guard !urlEpisodes.isEmpty else { return .success([]) }

        do {
            let result = try await episodesRepository.fetchEpisodes(urlEpisodes: urlEpisodes)
            urlEpisodes = result.info.next ?? .empty
            return .success(result.episodes)
        } catch {
            return .failure(error)
        }
    }
}
