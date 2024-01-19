//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 13/01/2024.
//

import Foundation
import Combine

protocol CharacterDetailViewModel: BaseViewModel {
    var characterName: String { get }
    var status: String { get }
    var specie: String { get }
    var imageData: Data? { get }
    var origin: String { get }
    var location: String { get }
}

final class CharacterDetailViewModelImp: CharacterDetailViewModel {

    // MARK: - Internal Properties
    var state: PassthroughSubject<StateController, Never>

    var characterName: String {
        character?.name ?? .empty
    }

    var status: String {
        character?.status?.description ?? .empty
    }

    var specie: String {
        character?.specie.description ?? .empty
    }

    var imageData: Data? {
        imageDataUseCase.getDataFromCache(url: character?.urlImage)
    }

    var origin: String {
        character?.origin.name ?? .empty
    }

    var location: String {
        character?.location.name ?? .empty
    }

    // MARK: - Private Properties
    private let loadCharacterDetailUseCase: LoadCharacterDetailUseCase
    private let imageDataUseCase: ImageDataUseCase
    private var character: Character?

    init(
        state: PassthroughSubject<StateController, Never>,
        loadCharacterDetailUseCase: LoadCharacterDetailUseCase,
        imageDataUseCase: ImageDataUseCase
    ) {
        self.state = state
        self.loadCharacterDetailUseCase = loadCharacterDetailUseCase
        self.imageDataUseCase = imageDataUseCase
    }

    func viewDidLoad() {
        state.send(.loading)
        Task {
            do {
                let characterResult = try await loadCharacterDetailUseCase.execute()
                character = characterResult
                state.send(.success)
            } catch {
                state.send(.fail(error: error.localizedDescription))
            }
        }
    }


}
