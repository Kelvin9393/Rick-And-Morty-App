//
//  CharactersResultsDTO.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 31/12/2023.
//

import Foundation

struct CharactersResultsDTO: Decodable {
    let results: [CharacterDTO]
    let info: InfoDTO
}

//extension CharactersResultsDTO: PropertyIterator { }
