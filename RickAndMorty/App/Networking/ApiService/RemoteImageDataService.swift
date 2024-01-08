//
//  RemoteImageDataService.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 07/01/2024.
//

import Foundation

protocol RemoteImageDataService {
    func request(url: URL?) async -> Data?
}
