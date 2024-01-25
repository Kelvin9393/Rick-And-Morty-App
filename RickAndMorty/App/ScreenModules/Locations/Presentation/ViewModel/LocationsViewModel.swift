//
//  LocationsViewModel.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 21/01/2024.
//

import Foundation
import Combine

protocol LocationsViewModel: BaseViewModel {
    var locationItemsCount: Int { get }
    var isLastPage: Bool { get }
    func getLocationItemViewModel(row: Int) -> LocationItemViewModel
}

final class LocationsViewModelImp: LocationsViewModel {
    // MARK: - Internal Properties
    var state: PassthroughSubject<StateController, Never>
    var locationItemsCount: Int {
        locations.count
    }
    var isLastPage: Bool {
        lastPageValidationUseCase.lastPage
    }

    // MARK: - Private Properties
    private var locations = [Location]()
    private var loadLocationsUseCase: LoadLocationsUseCase
    private var lastPageValidationUseCase: LastPageValidationUseCase

    // MARK: - Lifecycle
    init(
        state: PassthroughSubject<StateController, Never>,
        loadLocationsUseCase: LoadLocationsUseCase,
        lastPageValidationUseCase: LastPageValidationUseCase
    ) {
        self.state = state
        self.loadLocationsUseCase = loadLocationsUseCase
        self.lastPageValidationUseCase = lastPageValidationUseCase
    }

    func viewDidLoad() {
        state.send(.loading)
        Task {
            await loadLocationsUseCase()
        }
    }

    // MARK: - Helpers
    func getLocationItemViewModel(row: Int) -> LocationItemViewModel {
        checkAndLoadMoreLocationItems(row: row)
        let location = locations[row]
        return LocationItemViewModel(location: location)
    }

    private func loadLocationsUseCase() async {
        let result = await loadLocationsUseCase.execute()
        updateStateUI(result: result)
    }

    private func updateStateUI(result: Result<[Location], Error>) {
        switch result {
        case .success(let locationsArray):
            lastPageValidationUseCase.updateLastPage(itemsCount: locationsArray.count)
            locations.append(contentsOf: locationsArray)
            state.send(.success)
        case .failure(let error):
            state.send(.fail(error: error.localizedDescription))
        }
    }

    private func checkAndLoadMoreLocationItems(row: Int) {
        lastPageValidationUseCase.checkAndLoadMoreItems(
            row: row,
            actualItems: locations.count,
            action: viewDidLoad)
    }
}
