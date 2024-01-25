//
//  LocationsFactory.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 19/01/2024.
//

import UIKit
import Combine

protocol LocationsFactory {
    func makeModule() -> UIViewController
}

struct LocationsFactoryImp: LocationsFactory {
    private(set) var urlLocations: String
    private(set) var appContainer: AppContainer
    
    func makeModule() -> UIViewController {
        let state = PassthroughSubject<StateController, Never>()
        let locationsRepository = LocationsRepositoryImp(remoteService: appContainer.apiClient)
        let loadLocationsUseCase = LoadLocationsUseCaseImp(
            locationsRepository: locationsRepository,
            urlLocations: urlLocations)
        let lastPageValidationUseCase = LastPageValidationUseCaseImp()
        let viewModel = LocationsViewModelImp(
            state: state,
            loadLocationsUseCase: loadLocationsUseCase,
            lastPageValidationUseCase: lastPageValidationUseCase)
        let controller = LocationsViewController(viewModel: viewModel)
        controller.title = AppLocalized.locations
        return controller
    }
}


