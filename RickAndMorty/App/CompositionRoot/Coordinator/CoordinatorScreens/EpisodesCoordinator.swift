//
//  EpisodesCoordinator.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 23/01/2024.
//

import UIKit

final class EpisodesCoordinator: Coordinator {
    private let episodesFactory: EpisodesFactory
    var navigation: UINavigationController

    init(
        episodesFactory: EpisodesFactory,
        navigation: UINavigationController
    ) {
        self.episodesFactory = episodesFactory
        self.navigation = navigation
    }

    func start() {
        let controller = episodesFactory.makeModule()
        navigation.pushViewController(controller, animated: true)
        navigation.navigationBar.prefersLargeTitles = true
    }
}
