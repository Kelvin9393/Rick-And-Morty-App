//
//  EpisodesResultsDTO.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 23/01/2024.
//

import Foundation

struct EpisodesResultsDTO: Decodable {
    let info: InfoDTO
    let results: [EpisodeDTO]
}
