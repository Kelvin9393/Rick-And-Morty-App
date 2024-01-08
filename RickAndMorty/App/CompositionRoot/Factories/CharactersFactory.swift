//
//  CharactersFactory.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 30/12/2023.
//

import UIKit
import Combine

protocol CharactersFactory {
    func makeModule(coordinator: CharactersViewControllerCoordinator) -> UIViewController
    func makeCharacterDetailCoordinator(navigation: UINavigationController, urlDetail: String) -> Coordinator
}

struct CharactersFactoryImp: CharactersFactory {
    let urlList: String
    let appContainer: AppContainer

    func makeModule(coordinator: CharactersViewControllerCoordinator) -> UIViewController {
        let apiClientService = appContainer.apiClient
        let characterRepository = CharacterRepositoryImp(apiClientService: apiClientService)
        let loadCharactersUseCase = LoadCharacterUseCaseImp(
            charactersRepository: characterRepository,
            url: urlList
        )
        let lastPageValidationUseCase = LastPageValidationUseCaseImp()
        let state = PassthroughSubject<StateController, Never>()
        let viewModel = CharactersViewModelImp(
            state: state,
            loadCharactersUseCase: loadCharactersUseCase,
            lastPageValidationUseCase: lastPageValidationUseCase,
            imageDataUseCase: appContainer.getDataImageUseCase()
        )
        let controller = CharactersViewController(
            viewModel: viewModel,
            coordinator: coordinator
        )
        controller.title = "Characters"
        return controller
    }

    func makeCharacterDetailCoordinator(
        navigation: UINavigationController,
        urlDetail: String
    ) -> Coordinator {
        let characterDetailFactory = CharacterDetailFactoryImp(
            urlDetail: urlDetail,
            appContainer: appContainer
        )
        let characterDetailCoordinator = CharacterDetailCoordinator(
            navigation: navigation,
            characterDetailFactory: characterDetailFactory)
        return characterDetailCoordinator
    }
}
