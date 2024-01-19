//
//  CharacterItemViewModel.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 03/01/2024.
//

import Foundation

struct CharacterItemViewModel {
    private(set) var character: Character
    private(set) var imageDataUseCase: ImageDataUseCase

    var name: String {
        character.name
    }

    var specie: String {
        character.specie.description
    }

    var status: String {
        character.status?.description ?? ""
    }

    var imageData: Data? {
        imageDataUseCase.getDataFromCache(url: character.urlImage)
    }

    // TODO: - create the URL in the Data layer not in the Presentation layer
    func getImageData() async -> Data? {
        let url = URL(string: character.urlImage ?? .empty)
        return await imageDataUseCase.getData(url: url)
    }
}
