//
//  EpisodesViewController.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 23/01/2024.
//

import UIKit
import Combine

class EpisodesViewController: UITableViewController {

    // MARK: - Private Properties
    private let viewModel: EpisodesViewModel
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Lifecycle
    init(
        viewModel: EpisodesViewModel
    ) {
        self.viewModel = viewModel
        super.init(style: .insetGrouped)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        stateController()
        addSpinnerLastCell()
        viewModel.viewDidLoad()
    }

    // MARK: - Helpers
    private func configUI() {
        view.backgroundColor = .systemBackground
        tableView.register(
            EpisodeItemTableViewCell.self,
            forCellReuseIdentifier: EpisodeItemTableViewCell.reuseIdentifier)
    }

    private func stateController() {
        viewModel
            .state
            .receive(on: RunLoop.main)
            .sink { [weak self] state in
                switch state {
                case .success:
                    self?.tableView.reloadData()
                case .loading:
                    break
                case .fail(error: let error):
                    self?.presentAlert(message: error, title: "Error")
                }
            }
            .store(in: &cancellables)
    }
}

// MARK: - DataSource
extension EpisodesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.episodesItemCount
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: EpisodeItemTableViewCell.reuseIdentifier,
            for: indexPath
        ) as? EpisodeItemTableViewCell else {
            return UITableViewCell()
        }

        let viewModel = viewModel.getEpisodeItemViewModel(row: indexPath.row)
        cell.configData(viewModel: viewModel)
        return cell
    }

    override func tableView(
        _ tableView: UITableView,
        willDisplay cell: UITableViewCell,
        forRowAt indexPath: IndexPath
    ) {
        tableView.tableFooterView?.isHidden = viewModel.lastPage
    }
}

// MARK: - MessageDisplayable
extension EpisodesViewController: MessageDisplayable { }
