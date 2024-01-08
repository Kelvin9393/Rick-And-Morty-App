//
//  CharacterDetailCoordinator.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 08/01/2024.
//

import UIKit

final class CharacterDetailCoordinator: Coordinator {
    var navigation: UINavigationController
    private let characterDetailFactory: CharacterDetailFactory

    init(
        navigation: UINavigationController,
        characterDetailFactory: CharacterDetailFactory
    ) {
        self.navigation = navigation
        self.characterDetailFactory = characterDetailFactory
    }

    func start() {
        let viewController = characterDetailFactory.makeModule(coordinator: self)
        navigation.pushViewController(viewController, animated: true)
    }
}

extension CharacterDetailCoordinator: CharacterDetailViewControllerCoordinator {
    
}
