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
    func getUrlDetail(row: Int) -> String
}

final class CharactersViewModelImp: CharactersViewModel {
    var state: PassthroughSubject<StateController, Never>

    var isLastPage: Bool {
        lastPageValidationUseCase.lastPage
    }

    var characterItemsCount: Int {
        characters.count
    }
    
    private var characters = [Character]()
    private let loadCharactersUseCase: LoadCharactersUseCase
    private var lastPageValidationUseCase: LastPageValidationUseCase
    private let imageDataUseCase: ImageDataUseCase

    init(
        state: PassthroughSubject<StateController, Never>,
        loadCharactersUseCase: LoadCharactersUseCase,
        lastPageValidationUseCase: LastPageValidationUseCase,
        imageDataUseCase: ImageDataUseCase
    ) {
        self.state = state
        self.loadCharactersUseCase = loadCharactersUseCase
        self.lastPageValidationUseCase = lastPageValidationUseCase
        self.imageDataUseCase = imageDataUseCase
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
        case .success(let charactersArray):
            lastPageValidationUseCase.updateLastPage(itemsCount: charactersArray.count)
            characters.append(contentsOf: charactersArray)
            state.send(.success)
        case .failure(let error):
            state.send(.fail(error: error.localizedDescription))
        }
    }

    func getCharacterItemViewModel(row: Int) -> CharacterItemViewModel {
        checkAndLoadMoreCharacters(row: row)
        return makeCharacterItemViewModel(row: row)
    }

    private func checkAndLoadMoreCharacters(row: Int) {
        lastPageValidationUseCase.checkAndLoadMoreItems(
            row: row,
            actualItems: characters.count,
            action: viewDidLoad)
    }

    private func makeCharacterItemViewModel(row: Int) -> CharacterItemViewModel {
        let character = characters[row]
        let characterItemViewModel = CharacterItemViewModel(
            character: character,
            imageDataUseCase: imageDataUseCase
        )
        return characterItemViewModel
    }

    func getUrlDetail(row: Int) -> String {
        let character = characters[row]
        return character.urlCharacter
    }
}

