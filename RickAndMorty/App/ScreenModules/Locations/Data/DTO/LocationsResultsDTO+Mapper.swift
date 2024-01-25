//
//  LocationsResultsDTO+Mapper.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 20/01/2024.
//

import Foundation

extension LocationsResultsDTO {
    func toDomain() -> (info: Info, locations: [Location]) {
        let info = Info(next: info.next)
        let locations = results.map {
            Location(
                name: $0.name,
                type: $0.type,
                dimension: $0.dimension,
                url: $0.url)
        }

        return (info: info, locations: locations)
    }
}
