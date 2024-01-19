//
//  AppContainer.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 07/01/2024.
//

protocol AppContainer {
    var apiClient: ApiClientService & RemoteImageDataService { get }
    var localDataService: LocalDataImageService { get }
    func getImageDataUseCase() -> ImageDataUseCase
}

struct AppContainerImp: AppContainer {
    var apiClient: ApiClientService & RemoteImageDataService = ApiClientServiceImp()
    var localDataService: LocalDataImageService = LocalDataImageServiceImp()

    func getImageDataUseCase() -> ImageDataUseCase {
         let imageDataRepository = ImageDataRepositoryImp(
            remoteDataService: apiClient,
            localDataCache: localDataService
         )
        return ImageDataUseCaseImp(imageDataRepository: imageDataRepository)
    }
}
