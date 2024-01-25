//
//  EpisodesResultsDTO+Mapper.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 23/01/2024.
//

import Foundation

extension EpisodesResultsDTO {
    func toDomain() -> (info: Info, episodes: [Episode]) {
        let info = Info(next: info.next)
        let episodes = results.map {
            Episode(
                id: $0.id,
                name: $0.name,
                airDate: $0.airDate,
                episode: $0.episode)
        }
        return (info: info, episodes: episodes)
    }
}
