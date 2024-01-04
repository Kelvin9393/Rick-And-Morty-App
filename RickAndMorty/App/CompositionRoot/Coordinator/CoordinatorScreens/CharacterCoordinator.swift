//
//  CharacterCoordinator.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 30/12/2023.
//

import UIKit

final class CharacterCoordinator: Coordinator {
    var navigation: UINavigationController
    private let charactersFactory: CharactersFactory

    init(navigation: UINavigationController, charactersFactory: CharactersFactory) {
        self.navigation = navigation
        self.charactersFactory = charactersFactory
    }

    func start() {
        let controller = charactersFactory.makeModule(coordinator: self)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(controller, animated: true)
    }
}

extension CharacterCoordinator: CharactersViewControllerCoordinator {
    func didSelectMenuCell(urlDetail: String) {
        print("urlDetail: \(urlDetail)")
    }
}
