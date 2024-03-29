//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 30/12/2023.
//

import UIKit
import Combine

protocol CharactersViewControllerCoordinator {
    func didSelectCell(urlDetail: String)
}

class CharactersViewController: UITableViewController {

    // MARK: - Private Properties
    private var coordinator: CharactersViewControllerCoordinator
    private var cancellables = Set<AnyCancellable>()
    private let viewModel: CharactersViewModel

    // MARK: - Lifecyle
    init(
        viewModel: CharactersViewModel,
        coordinator: CharactersViewControllerCoordinator
    ) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configTableView()
        stateController()
        viewModel.viewDidLoad()
    }

    // MARK: - Helpers
    private func configTableView() {
        tableView.separatorStyle = .none
        tableView.register(
            CharacterItemTableViewCell.self,
            forCellReuseIdentifier: CharacterItemTableViewCell.reuseIdentifier
        )
        addSpinnerLastCell()
    }

    private func stateController() {
        viewModel.state
            .receive(on: RunLoop.main)
            .sink { [weak self] state in
                switch state {
                case .success:
                    self?.tableView.reloadData()
                case .loading:
                    break
                case .fail(let error):
                    self?.presentAlert(message: error, title: AppLocalized.error)
                }
            }.store(in: &cancellables)
    }
}

// MARK: - TableViewDataSource
extension CharactersViewController {
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        viewModel.characterItemsCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CharacterItemTableViewCell.reuseIdentifier,
            for: indexPath) as? CharacterItemTableViewCell else {
            return UITableViewCell()
        }

        let itemViewModel = viewModel.getCharacterItemViewModel(row: indexPath.row)
        cell.configData(viewModel: itemViewModel)
        return cell
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.tableFooterView?.isHidden = viewModel.isLastPage
    }
}

extension CharactersViewController {
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let urlDetail = viewModel.getUrlDetail(row: indexPath.row)
        coordinator.didSelectCell(urlDetail: urlDetail)
    }
}

extension CharactersViewController: SpinnerDisplayable { }

extension CharactersViewController: MessageDisplayable { }

