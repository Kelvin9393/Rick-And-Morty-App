//
//  LoadMenuUseCase.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 28/12/2023.
//

import Foundation

protocol LoadMenuUseCase {
    func execute() async -> Result<[MenuItem], Error>
}

struct LoadMenuUseCaseImp: LoadMenuUseCase {

    let menuRepository: MenuRepository

    init(menuRepository: MenuRepository) {
        self.menuRepository = menuRepository
    }

    func execute() async -> Result<[MenuItem], Error> {
        do {
            let repositoryResult = try await menuRepository.fetchMenuData()
            return .success(repositoryResult)
        } catch {
            return .failure(error)
        }
    }
}
