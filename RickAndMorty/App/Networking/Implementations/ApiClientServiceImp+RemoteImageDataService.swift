//
//  ApiClientServiceImp+RemoteImageDataService.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 07/01/2024.
//

import Foundation

extension ApiClientServiceImp: RemoteImageDataService {
    func request(url: URL?) async -> Data? {
        guard let url = url else {
            return nil
        }

        do {
            let (data: data, request: request) = try await session.data(from: url)
            return (data: data, request: request).data
        } catch {
            return nil
        }
    }
}
