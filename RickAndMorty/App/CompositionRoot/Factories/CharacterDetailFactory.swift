//
//  CharacterDetailFactory.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 08/01/2024.
//

import UIKit
import Combine

protocol CharacterDetailFactory {
    func makeModule(
        coordinator: CharacterDetailViewControllerCoordinator
    ) -> UIViewController
    func makeOriginCoordinator(
        navigation: UINavigationController
    ) -> Coordinator
    func makeLocationCoordinator(
        navigation: UINavigationController
    ) -> Coordinator
}

struct CharacterDetailFactoryImp: CharacterDetailFactory {
    let urlDetail: String
    let appContainer: AppContainer

    func makeModule(coordinator: CharacterDetailViewControllerCoordinator) -> UIViewController {
        let characterDetailRepository = CharacterDetailRepositoryImp(remoteService: appContainer.apiClient)
        let state = PassthroughSubject<StateController, Never>()
        let loadCharacterDetailUseCase = LoadCharacterDetailUseCaseImp(
            characterDetailRepository: characterDetailRepository,
            urlDetail: urlDetail)
        let viewModel = CharacterDetailViewModelImp(
            state: state,
            loadCharacterDetailUseCase: loadCharacterDetailUseCase,
            imageDataUseCase: appContainer.getImageDataUseCase())
        let controller = CharacterDetailViewController(
            viewModel: viewModel,
            coordinator: coordinator)
        return controller
    }

    func makeOriginCoordinator(navigation: UINavigationController) -> Coordinator {
        let originFactory = OriginFactoryImp()
        let originCoordinator = OriginCoordinator(
            navigation: navigation,
            originFactory: originFactory
        )
        return originCoordinator
    }

    func makeLocationCoordinator(navigation: UINavigationController) -> Coordinator {
        let locationDetailFactory = LocationDetailFactoryImp()
        let locationDetailCoordinator =  LocationDetailCoordinator(
            navigation: navigation,
            locationDetailFactory: locationDetailFactory
        )
        return locationDetailCoordinator
    }
}
