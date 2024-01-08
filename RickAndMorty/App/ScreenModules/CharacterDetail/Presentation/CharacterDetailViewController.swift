//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 08/01/2024.
//

import UIKit

protocol CharacterDetailViewControllerCoordinator {

}

class CharacterDetailViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configUserInterface()
    }

    private func configUserInterface() {
        view.backgroundColor = .systemBackground
    }
}
