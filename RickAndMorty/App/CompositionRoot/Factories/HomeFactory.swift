//
//  HomeFactory.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 26/12/2023.
//

import UIKit
import Combine

protocol HomeFactory {
    func makeModule(coordinator: HomeMenuViewContollerCoordinator) -> UIViewController
}

struct HomeFactoryImp: HomeFactory {
    func makeModule(coordinator: HomeMenuViewContollerCoordinator) -> UIViewController {
        let apiClientService = ApiClientServiceImp()
        let menuRepository = MenuRepositoryImp(apiClientService: apiClientService, urlList: Endpoint.baseUrl)
        let loadMenuUseCase = LoadMenuUseCaseImp(menuRepository: menuRepository)
        let state = PassthroughSubject<StateController, Never>()
        let homeMenuViewModel = HomeMenuViewModelImp(state: state, loadMenuUseCase: loadMenuUseCase)
        let homeMenuController = HomeMenuController(
            homeMenuViewModel: homeMenuViewModel,
            layout: makeLayout(),
            coordinator: coordinator
        )
        homeMenuController.title = AppLocalized.appName
        return homeMenuController
    }

    private func makeLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let layoutWidth = (ViewValues.widthScreen - ViewValues.doublePadding) / ViewValues.multiplierTwo
        let layoutHeight = (ViewValues.widthScreen - ViewValues.doublePadding) / ViewValues.multiplierTwo
        layout.itemSize = .init(width: layoutWidth, height: layoutHeight)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.sectionInset = .init(
            top: 0,
            left: ViewValues.normalPadding,
            bottom: 0,
            right: ViewValues.normalPadding
        )
        return layout
    }
}
