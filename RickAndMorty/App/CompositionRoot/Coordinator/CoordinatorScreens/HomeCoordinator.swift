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
        let controller = homeFactory.makeModule()
        navigation.pushViewController(controller, animated: true)
    }


}
