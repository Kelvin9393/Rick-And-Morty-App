//
//  LoadCharactersUseCase.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 02/01/2024.
//

import Foundation

protocol LoadCharactersUseCase {
    func execute() async -> Result<[Character], Error>
}

final class LoadCharacterUseCaseImp: LoadCharactersUseCase {

    private let charactersRepository: CharactersRepository
    private var url: String
    private var result: (info: Info, characters: [Character])?

    init(charactersRepository: CharactersRepository, url: String ) {
        self.charactersRepository = charactersRepository
        self.url = url
    }

    func execute() async -> Result<[Character], Error> {
        guard !url.isEmpty else { return .success([]) }
        do {
            let repositoryResult = try await charactersRepository.fetchCharacters(urlList: url)
            url = repositoryResult.info.next ?? .empty
            return .success(repositoryResult.characters)
        } catch {
            return .failure(error)
        }
    }
}
