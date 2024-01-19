//
//  ImageDataUseCase.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 07/01/2024.
//

import Foundation

protocol ImageDataUseCase {
    func getData(url: URL?) async -> Data?
    func getDataFromCache(url: String?) -> Data?
}

struct ImageDataUseCaseImp: ImageDataUseCase {
    private(set) var imageDataRepository: ImageDataRepository

    func getData(url: URL?) async -> Data? {
        await imageDataRepository.fetchData(url: url)
    }

    func getDataFromCache(url: String?) -> Data? {
        imageDataRepository.getFromCache(url: url)
    }
}
