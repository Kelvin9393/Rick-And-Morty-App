//
//  EpisodesViewModel.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 25/01/2024.
//

import Foundation
import Combine

protocol EpisodesViewModel: BaseViewModel {
    var episodesItemCount: Int { get }
    var lastPage: Bool { get }
    func getEpisodeItemViewModel(row: Int) -> EpisodeItemViewModel
}

final class EpisodesViewModelImp: EpisodesViewModel {
    // MARK: - Internal Properties
    var state: PassthroughSubject<StateController, Never>
    var episodesItemCount: Int {
        episodes.count
    }
    var lastPage: Bool {
        lastPageValidationUseCase.lastPage
    }

    // MARK: - Private Properties
    private var episodes = [Episode]()
    private var loadEpisodesUseCase: LoadEpisodesUseCase
    private var lastPageValidationUseCase: LastPageValidationUseCase

    // MARK: - Lifecycle
    init(
        state: PassthroughSubject<StateController, Never>,
        loadEpisodesUseCase: LoadEpisodesUseCase,
        lastPageValidationUseCase: LastPageValidationUseCase
    ) {
        self.state = state
        self.loadEpisodesUseCase = loadEpisodesUseCase
        self.lastPageValidationUseCase = lastPageValidationUseCase
    }

    func viewDidLoad() {
        state.send(.loading)
        Task {
            let result = await loadEpisodesUseCase.getEpisodes()
            switch result {
            case .success(let episodesArray):
                lastPageValidationUseCase.updateLastPage(itemsCount: episodesArray.count)
                episodes.append(contentsOf: episodesArray)
                state.send(.success)
            case .failure(let error):
                state.send(.fail(error: error.localizedDescription))
            }
        }
    }

    // MARK: - Helpers
    func getEpisodeItemViewModel(row: Int) -> EpisodeItemViewModel {
        lastPageValidationUseCase.checkAndLoadMoreItems(
            row: row,
            actualItems: episodes.count,
            action: viewDidLoad)
        let episode = episodes[row]
        return EpisodeItemViewModel(episode: episode)
    }
}
