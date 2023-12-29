//
//  MenuDTO.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 29/12/2023.
//

import Foundation

struct MenuDTO: Decodable {
    let characters: String
    let locations: String
    let episodes: String
}

extension MenuDTO: PropertyIterator {}
