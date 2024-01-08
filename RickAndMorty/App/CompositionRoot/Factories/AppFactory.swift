//
//  AppFactory.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 25/12/2023.
//

import UIKit

protocol AppFactory {
    func makeHomeCoordinator(navigation: UINavigationController) -> Coordinator
}

struct AppFactoryImp: AppFactory {
    let appContainer = AppContainerImp()
    
    func makeHomeCoordinator(navigation: UINavigationController) -> Coordinator {
        let homeFactory = HomeFactoryImp(appContainer: appContainer)
        let homeCoordinator = HomeCoordinator(navigation: navigation, factory: homeFactory)
        return homeCoordinator
    }
}
