//
//  HomeMenuController.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 23/12/2023.
//

import UIKit
import Combine

class HomeMenuController: UICollectionViewController {

    private let viewModel: HomeMenuViewModel
    private var cancellables = Set<AnyCancellable>()

    init(homeMenuViewModel: HomeMenuViewModel, layout: UICollectionViewLayout) {
        self.viewModel = homeMenuViewModel
        super.init(collectionViewLayout: layout)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        configCollectionView()
        stateController()
        viewModel.viewDidLoad()
    }

    private func stateController() {
        viewModel
            .state
            .receive(on: RunLoop.main)
            .sink { state in
            switch state {
            case .success:
                self.collectionView.reloadData()
            case .loading:
                print("loading")
            case .fail(let error):
                print("error", error)
            }
        }.store(in: &cancellables)
    }

    private func configUI() {
        view.backgroundColor = .systemBackground
    }

    private func configCollectionView() {
        collectionView.register(HomeMenuItemCell.self, forCellWithReuseIdentifier: HomeMenuItemCell.reuseIdentifier)
    }
}

extension HomeMenuController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.menuItemsCount
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeMenuItemCell.reuseIdentifier,
                for: indexPath
            ) as? HomeMenuItemCell else {
            return UICollectionViewCell()
        }

        cell.configData(viewModel: viewModel.getMenuItemViewModel(indexPath: indexPath))
        return cell
    }
}
