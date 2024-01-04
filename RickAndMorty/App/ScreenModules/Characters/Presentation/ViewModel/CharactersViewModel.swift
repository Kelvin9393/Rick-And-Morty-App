//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 03/01/2024.
//

import Combine

protocol CharactersViewModel: BaseViewModel {
    var characterItemsCount: Int { get  }
    var isLastPage: Bool { get }
    func getCharacterItemViewModel(row: Int) -> CharacterItemViewModel
    func getUrlList(row: Int) -> String
}

final class CharactersViewModelImp: CharactersViewModel {
    var state: PassthroughSubject<StateController, Never>

    var isLastPage = false

    var characterItemsCount: Int {
        characters.count
    }
    
    private var characters = [Character]()
    private let loadCharactersUseCase: LoadCharactersUseCase

    init(
        state: PassthroughSubject<StateController, Never>,
        loadCharactersUseCase: LoadCharactersUseCase
    ) {
        self.state = state
        self.loadCharactersUseCase = loadCharactersUseCase
    }

    func viewDidLoad() {
        state.send(.loading)
        Task {
            await loadCharactersUseCase()
        }
    }

    private func loadCharactersUseCase() async {
        let resultUseCase = await loadCharactersUseCase.execute()
        updateStateUI(result: resultUseCase)
    }

    private func updateStateUI(result: Result<[Character], Error>) {
        switch result {
        case .success(let characters):
            self.characters.append(contentsOf: characters)
            state.send(.success)
        case .failure(let error):
            state.send(.fail(error: error.localizedDescription))
        }
    }

    func getCharacterItemViewModel(row: Int) -> CharacterItemViewModel {
        let character = characters[row]
        let characterItemViewModel = CharacterItemViewModel(character: character)
        return characterItemViewModel
    }

    func getUrlList(row: Int) -> String {
        let character = characters[row]
        return character.urlCharacter
    }
}

