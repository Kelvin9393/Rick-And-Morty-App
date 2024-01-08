//
//  ImageDataRepositoryImp.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 07/01/2024.
//

import Foundation

struct ImageDataRepositoryImp: ImageDataRepository {
    private(set) var remoteDataService: RemoteImageDataService
    private(set) var localDataCache: LocalDataImageService

    init(
        remoteDataService: RemoteImageDataService,
        localDataCache: LocalDataImageService
    ) {
        self.remoteDataService = remoteDataService
        self.localDataCache = localDataCache
    }

    func fetchData(url: URL?) async -> Data? {
        let data = await remoteDataService.request(url: url)
        localDataCache.save(key: url?.absoluteString ?? .empty, data: data)
        return data
    }

    func getFromCache(url: URL?) -> Data? {
        let data = localDataCache.get(key: url?.absoluteString ?? .empty)
        return data
    }
}
