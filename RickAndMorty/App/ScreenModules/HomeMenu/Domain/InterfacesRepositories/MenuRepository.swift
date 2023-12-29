//
//  MenuRepository.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 28/12/2023.
//

import Foundation

protocol MenuRepository {
    func fetchMenuData() async throws -> [MenuItem]
}
