//
//  CharactersRepository.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 01/01/2024.
//

import Foundation

protocol CharactersRepository {
    func fetchCharacters(urlList: String) async throws -> (info: Info, characters: [Character])
}
