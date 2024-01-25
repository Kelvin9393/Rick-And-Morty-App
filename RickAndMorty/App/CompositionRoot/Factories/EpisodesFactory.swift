//
//  EpisodesFactory.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 23/01/2024.
//

import UIKit
import Combine

protocol EpisodesFactory {
    func makeModule() -> UIViewController
}

struct EpisodesFactoryImp: EpisodesFactory {
    private let urlEpisodes: String
    private let appContainer: AppContainer

    init(
        urlEpisodes: String,
        appContainer: AppContainer
    ) {
        self.urlEpisodes = urlEpisodes
        self.appContainer = appContainer
    }
    
    func makeModule() -> UIViewController {
        let state = PassthroughSubject<StateController, Never>()
        let episodesRepository = EpisodesRepositoryImp(remoteService: appContainer.apiClient)
        let loadEpisodesUseCase = LoadEpisodesUseCaseImp(
            episodesRepository: episodesRepository,
            urlEpisodes: urlEpisodes)
        let lastPageValidationUseCase = LastPageValidationUseCaseImp()
        let episodesViewModel = EpisodesViewModelImp(
            state: state,
            loadEpisodesUseCase: loadEpisodesUseCase,
            lastPageValidationUseCase: lastPageValidationUseCase
        )
        let controller = EpisodesViewController(viewModel: episodesViewModel)
        controller.title = "Episodes"
        return controller
    }
}
