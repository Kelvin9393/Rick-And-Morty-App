//
//  OriginFactory.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 19/01/2024.
//

import UIKit

protocol OriginFactory  {
    func makeModule() -> UIViewController
}

struct OriginFactoryImp: OriginFactory {
    func makeModule() -> UIViewController {
        let controller = OriginViewController()
        controller.title = "Origin"
        return controller
    }
}


