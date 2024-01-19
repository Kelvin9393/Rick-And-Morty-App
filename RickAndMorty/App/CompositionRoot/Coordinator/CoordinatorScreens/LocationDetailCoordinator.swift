//
//  LocationDetailCoordinator.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 19/01/2024.
//

import UIKit

final class LocationDetailCoordinator: Coordinator {
    private let locationDetailFactory: LocationDetailFactory

    var navigation: UINavigationController

    init(
        navigation: UINavigationController,
        locationDetailFactory: LocationDetailFactory
    ) {
        self.navigation = navigation
        self.locationDetailFactory = locationDetailFactory
    }

    func start() {
        let controller = locationDetailFactory.makeModule()
        navigation.pushViewController(controller, animated: true)
    }
}
