//
//  CharacterDetailRepositoryImp.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 13/01/2024.
//

import Foundation

struct CharacterDetailRepositoryImp: CharacterDetailRepository {
    private(set) var remoteService: ApiClientService

    func fetchCharacterDetail(urlDetail: String) async throws -> Character {
        let url = URL(string: urlDetail)
        let result = try await remoteService.request(url: url, type: CharacterDTO.self)
        return result.toDomain()
    }
}
