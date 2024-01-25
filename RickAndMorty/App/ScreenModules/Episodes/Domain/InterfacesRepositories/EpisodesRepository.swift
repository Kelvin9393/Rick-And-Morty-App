//
//  EpisodesRepository.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 23/01/2024.
//

import Foundation

protocol EpisodesRepository {
    func fetchEpisodes(urlEpisodes: String) async throws -> (info: Info, episodes: [Episode])
}
