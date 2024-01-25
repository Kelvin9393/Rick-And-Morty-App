//
//  LoadLocationsUseCase.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 20/01/2024.
//

protocol LoadLocationsUseCase {
    mutating func execute() async -> Result<[Location], Error>
}

struct LoadLocationsUseCaseImp: LoadLocationsUseCase {
    private let locationsRepository: LocationsRepository
    private var urlLocations: String

    init(
        locationsRepository: LocationsRepository,
        urlLocations: String
    ) {
        self.locationsRepository = locationsRepository
        self.urlLocations = urlLocations
    }

    mutating func execute() async -> Result<[Location], Error> {
        guard !urlLocations.isEmpty else { return .success([]) }

        do {
            let result = try await locationsRepository.fetchLocations(urlLocations: urlLocations)
            urlLocations = result.info.next ?? .empty
            return .success(result.locations)
        } catch {
            return .failure(error)
        }
    }
}
