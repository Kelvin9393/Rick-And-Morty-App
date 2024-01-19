//
//  CharacterDTO+Mapping.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 13/01/2024.
//

import Foundation

extension CharacterDTO {
    func toDomain() -> Character {
        let status = CharacterStatus(status: status)
        let specie = Specie(specie: species)
        let origin = Origin(name: origin.name, url: origin.url)
        let location = Location(name: location.name, type: location.type, dimension: location.dimension, url: location.url)
        return Character(
            id: id,
            name: name,
            status: status,
            specie: specie,
            urlCharacter: url,
            urlImage: image,
            origin: origin,
            location: location)
    }
}
