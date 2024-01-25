//
//  EpisodesRepositoryImp.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 23/01/2024.
//

import Foundation

struct EpisodesRepositoryImp: EpisodesRepository {
    private(set) var remoteService: ApiClientService

    func fetchEpisodes(urlEpisodes: String) async throws -> (info: Info, episodes: [Episode]) {
        let url = URL(string: urlEpisodes)
        return try await remoteService
            .request(url: url,
                     type: EpisodesResultsDTO.self)
            .toDomain()
    }
}
