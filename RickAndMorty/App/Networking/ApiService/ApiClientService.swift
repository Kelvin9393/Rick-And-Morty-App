//
//  ApiClientService.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 29/12/2023.
//

import Foundation

protocol ApiClientService {
    func request<T: Decodable>(url: URL?, type: T.Type) async throws -> T
}
