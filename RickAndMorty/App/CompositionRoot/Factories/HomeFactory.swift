//
//  HomeFactory.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 26/12/2023.
//

import UIKit
import Combine

protocol HomeFactory {
    func makeModule(
        coordinator: HomeMenuViewContollerCoordinator
    ) -> UIViewController

    func makeCharactersCoordinator(
        navigation: UINavigationController,
        urlList: String
    ) -> Coordinator

    func makeLocationsCoordinator(
        navigation: UINavigationController,
        urlLocations: String
    ) -> Coordinator

    func makeEpisodesCoordinator(
        navigation: UINavigationController,
        urlEpisodes: String
    ) -> Coordinator
}

struct HomeFactoryImp: HomeFactory {

    let appContainer: AppContainer
    
    func makeModule(coordinator: HomeMenuViewContollerCoordinator) -> UIViewController {
        let apiClientService = appContainer.apiClient
        let menuRepository = MenuRepositoryImp(apiClientService: apiClientService, urlList: Endpoint.baseUrl)
        let loadMenuUseCase = LoadMenuUseCaseImp(menuRepository: menuRepository)
        let state = PassthroughSubject<StateController, Never>()
        let homeMenuViewModel = HomeMenuViewModelImp(state: state, loadMenuUseCase: loadMenuUseCase)
        let homeMenuController = HomeMenuController(
            homeMenuViewModel: homeMenuViewModel,
            layout: makeLayout(),
            coordinator: coordinator
        )
        homeMenuController.title = AppLocalized.appName
        return homeMenuController
    }

    private func makeLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let layoutWidth = (ViewValues.widthScreen - ViewValues.doublePadding) / ViewValues.multiplierTwo
        let layoutHeight = (ViewValues.widthScreen - ViewValues.doublePadding) / ViewValues.multiplierTwo
        layout.itemSize = .init(width: layoutWidth, height: layoutHeight)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.sectionInset = .init(
            top: 0,
            left: ViewValues.normalPadding,
            bottom: 0,
            right: ViewValues.normalPadding
        )
        return layout
    }

    func makeCharactersCoordinator(
        navigation: UINavigationController,
        urlList: String
    ) -> Coordinator {
        let charactersFactory = CharactersFactoryImp(
            urlList: urlList,
            appContainer: appContainer
        )
        let coordinator = CharacterCoordinator(
            navigation: navigation,
            charactersFactory: charactersFactory
        )
        return coordinator
    }

    func makeLocationsCoordinator(
        navigation: UINavigationController,
        urlLocations: String
    ) -> Coordinator {
        let locationsFactory = LocationsFactoryImp(
            urlLocations: urlLocations,
            appContainer: appContainer
        )
        let coordinator = LocationsCoordinator(
            navigation: navigation,
            locationsFactory: locationsFactory
        )
        return coordinator
    }

    func makeEpisodesCoordinator(
        navigation: UINavigationController,
        urlEpisodes: String
    ) -> Coordinator {
        let episodesFactory = EpisodesFactoryImp(
            urlEpisodes: urlEpisodes,
            appContainer: appContainer
        )
        let coordinator = EpisodesCoordinator(
            episodesFactory: episodesFactory,
            navigation: navigation
        )
        return coordinator
    }
}
