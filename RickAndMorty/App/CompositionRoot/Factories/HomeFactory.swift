//
//  HomeFactory.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 26/12/2023.
//

import UIKit
import Combine

protocol HomeFactory {
    func makeModule() -> UIViewController
}

struct HomeFactoryImp: HomeFactory {
    func makeModule() -> UIViewController {
        let apiClientService = ApiClientServiceImp()
        let menuRepository = MenuRepositoryImp(apiClientService: apiClientService, urlList: Endpoint.baseUrl)
        let loadMenuUseCase = LoadMenuUseCaseImp(menuRepository: menuRepository)
        let state = PassthroughSubject<StateController, Never>()
        let homeMenuViewModel = HomeMenuViewModelImp(state: state, loadMenuUseCase: loadMenuUseCase)
        let homeMenuController = HomeMenuController(
            homeMenuViewModel: homeMenuViewModel,
            layout: makeLayout()
        )
        homeMenuController.title = "Rick And Morty"
        return homeMenuController
    }

    private func makeLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let layoutWidth = (UIScreen.main.bounds.width - 20) / 2
        let layoutHeight = (UIScreen.main.bounds.width - 20) / 2
        layout.itemSize = .init(width: layoutWidth, height: layoutHeight)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.sectionInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        return layout
    }
}
