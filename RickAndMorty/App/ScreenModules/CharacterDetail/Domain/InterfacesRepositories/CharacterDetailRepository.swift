//
//  CharacterDetailRepository.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 13/01/2024.
//

import Foundation

protocol CharacterDetailRepository {
    func fetchCharacterDetail(urlDetail: String) async throws -> Character
}
