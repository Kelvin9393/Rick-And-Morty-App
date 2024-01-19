//
//  OriginCoordinator.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 19/01/2024.
//

import UIKit

final class OriginCoordinator: Coordinator {
    private let originFactory: OriginFactory

    var navigation: UINavigationController

    init(
        navigation: UINavigationController,
        originFactory: OriginFactory
    ) {
        self.navigation = navigation
        self.originFactory = originFactory
    }

    func start() {
        let controller = originFactory.makeModule()
        navigation.pushViewController(controller, animated: true)
    }
}
