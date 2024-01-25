//
//  LocationsCoordinator.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 19/01/2024.
//

import UIKit

final class LocationsCoordinator: Coordinator {
    private let locationsFactory: LocationsFactory
    var navigation: UINavigationController

    init(
        navigation: UINavigationController,
        locationsFactory: LocationsFactory) {
            self.navigation = navigation
            self.locationsFactory = locationsFactory
        }

    func start() {
        let controller = locationsFactory.makeModule()
        navigation.pushViewController(controller, animated: true)
        navigation.navigationBar.prefersLargeTitles = true
    }
}
