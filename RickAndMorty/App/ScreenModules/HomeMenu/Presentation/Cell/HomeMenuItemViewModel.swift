//
//  HomeMenuItemViewModel.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 28/12/2023.
//

import Foundation

struct HomeMenuItemViewModel {
    let menuItem: MenuItem

    init(menuItem: MenuItem) {
        self.menuItem = menuItem
    }

    var title: String {
        menuItem.title.capitalized
    }

    var imageName: String {
        menuItem.title
    }
}
