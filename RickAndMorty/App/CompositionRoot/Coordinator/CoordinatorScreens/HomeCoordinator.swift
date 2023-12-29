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
            goToCharacters()
        case "episodes":
            goToEpisodes()
        case "locations":
            goToLocations()
        default:
            break
        }
    }

    private func goToCharacters() {
        print("screen characters")
    }

    private func goToEpisodes() {
        print("screen episodes")
    }

    private func goToLocations() {
        print("screen locations")
    }
}
