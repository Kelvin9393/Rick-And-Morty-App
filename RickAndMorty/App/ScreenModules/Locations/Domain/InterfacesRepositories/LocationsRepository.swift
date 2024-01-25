//
//  LocationsRepository.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 20/01/2024.
//

import Foundation

protocol LocationsRepository {
    func fetchLocations(
        urlLocations: String
    ) async throws -> (info: Info, locations: [Location])
}
