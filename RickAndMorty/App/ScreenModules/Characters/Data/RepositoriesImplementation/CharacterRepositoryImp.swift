//
//  CharacterRepositoryImp.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 01/01/2024.
//

import Foundation

struct CharacterRepositoryImp: CharactersRepository {
    let apiClientService: ApiClientService
    
    func fetchCharacters(
        urlList: String
    ) async throws -> (info: Info, characters: [Character]) {
        let url = URL(string: urlList)
        return try await apiClientService.request(url: url, type: CharactersResultsDTO.self).toDomain()
    }
}
