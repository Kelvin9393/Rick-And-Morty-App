//
//  AppCoordinator.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 25/12/2023.
//

import UIKit

final class AppCoordinator: Coordinator {
    var navigation: UINavigationController
    private let appFactory: AppFactory
    private var homeCoordinator: Coordinator?

    init(navigation: UINavigationController, appFactory: AppFactory, window: UIWindow?) {
        self.navigation = navigation
        self.appFactory = appFactory
        configWindow(window: window)
    }

    func start() {
        homeCoordinator = appFactory.makeHomeCoordinator(navigation: navigation)
        homeCoordinator?.start()
    }

    private func configWindow(window: UIWindow?) {
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}
