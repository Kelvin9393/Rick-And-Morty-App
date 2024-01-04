//
//  CharacterItemViewModel.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 03/01/2024.
//

import Foundation

struct CharacterItemViewModel {
    private let character: Character

    init(character: Character) {
        self.character = character
    }

    var name: String {
        character.name
    }

    var specie: String {
        character.specie.description
    }

    var status: String {
        character.status?.description ?? ""
    }
}
