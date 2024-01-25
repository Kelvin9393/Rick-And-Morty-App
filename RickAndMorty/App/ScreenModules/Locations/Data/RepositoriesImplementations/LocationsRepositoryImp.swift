//
//  LocationsRepositoryImp.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 20/01/2024.
//

import Foundation

struct LocationsRepositoryImp: LocationsRepository {
    private(set) var remoteService: ApiClientService

    func fetchLocations(
        urlLocations: String
    ) async throws -> (info: Info, locations: [Location]) {
        let url = URL(string: urlLocations)
        return try await remoteService
            .request(url: url, type: LocationsResultsDTO.self)
            .toDomain()
    }
}
