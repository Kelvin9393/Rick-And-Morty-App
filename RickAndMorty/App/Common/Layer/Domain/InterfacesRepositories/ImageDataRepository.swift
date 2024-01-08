//
//  ImageDataRepository.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 07/01/2024.
//

import Foundation

protocol ImageDataRepository {
    func fetchData(url: URL?) async -> Data?
    func getFromCache(url: URL?) -> Data?
}
