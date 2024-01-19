//
//  LoadCharacterDetailUseCase.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 13/01/2024.
//

import Foundation

protocol LoadCharacterDetailUseCase {
    func execute() async throws -> Character
}

struct LoadCharacterDetailUseCaseImp: LoadCharacterDetailUseCase {
    private(set) var characterDetailRepository: CharacterDetailRepository
    private(set) var urlDetail: String

    func execute() async throws -> Character {
        try await characterDetailRepository.fetchCharacterDetail(urlDetail: urlDetail)
    }
}
