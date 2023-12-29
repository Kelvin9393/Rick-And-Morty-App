//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 25/12/2023.
//

import UIKit

protocol Coordinator {
    var navigation: UINavigationController { get }
    func start()
}
