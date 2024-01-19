//
//  LocationDetailFactory.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 19/01/2024.
//

import UIKit

protocol LocationDetailFactory {
    func makeModule() -> UIViewController
}

struct LocationDetailFactoryImp: LocationDetailFactory {
    func makeModule() -> UIViewController {
        let controller = LocationDetailViewController()
        controller.title = "Location Detail"
        return controller
    }
}
