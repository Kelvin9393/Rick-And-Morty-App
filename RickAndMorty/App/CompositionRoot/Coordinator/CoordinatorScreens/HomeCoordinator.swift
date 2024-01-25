//
//  HomeCoordinator.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 26/12/2023.
//

import UIKit

final class HomeCoordinator: Coordinator {
    var navigation: UINavigationController
    private let homeFactory: HomeFactory
    private var charactersCoordinator: Coordinator?
    private var locationsCoordinator: Coordinator?

    init(navigation: UINavigationController, factory: HomeFactory) {
        self.navigation = navigation
        self.homeFactory = factory
    }

    func start() {
        let controller = homeFactory.makeModule(coordinator: self)
        navigation.pushViewController(controller, animated: true)
    }
}

extension HomeCoordinator: HomeMenuViewContollerCoordinator {
    func didSelectMenuCell(model: MenuItem) {
        // TODO: Use enum or struct to avoid string directly
        switch model.title {
        case "characters":
            goToCharacters(urlList: model.url)
        case "episodes":
            goToEpisodes(urlEpisodes: model.url)
        case "locations":
            goToLocations(urlLocations: model.url)
        default:
            break
        }
    }

    private func goToCharacters(urlList: String) {
        charactersCoordinator = homeFactory.makeCharactersCoordinator(
            navigation: navigation,
            urlList: urlList)
        charactersCoordinator?.start()
    }

    private func goToEpisodes(urlEpisodes: String) {
        let episodesCoordinator = homeFactory
            .makeEpisodesCoordinator(
                navigation: navigation,
                urlEpisodes: urlEpisodes)
        episodesCoordinator.start()
    }

    private func goToLocations(urlLocations: String) {
        locationsCoordinator = homeFactory
            .makeLocationsCoordinator(
                navigation: navigation,
                urlLocations: urlLocations)
        locationsCoordinator?.start()
    }
}
