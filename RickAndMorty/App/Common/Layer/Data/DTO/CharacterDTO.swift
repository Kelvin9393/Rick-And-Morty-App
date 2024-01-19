//
//  CharacterDTO.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 31/12/2023.
//

import Foundation

struct CharacterDTO: Decodable {
    let id: Int
    let name: String
    let status: String?
    let species: String?
    let image: String?
    let url: String
    let origin: OriginDTO
    let location: LocationDTO
}
