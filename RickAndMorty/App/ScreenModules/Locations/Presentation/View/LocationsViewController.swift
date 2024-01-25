//
//  LocationsViewController.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 19/01/2024.
//

import UIKit
import Combine

class LocationsViewController: UITableViewController {
    // MARK: - Private Properties
    private let viewModel: LocationsViewModel
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Lifecycle
    init(viewModel: LocationsViewModel) {
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
            LocationItemTableViewCell.self,
            forCellReuseIdentifier: LocationItemTableViewCell.reuseIdentifier)
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
                case .fail(let error):
                    self?.presentAlert(message: error, title: "Error")
                }
            }
            .store(in: &cancellables)
    }
}

// MARK: - DataSource
extension LocationsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.locationItemsCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationItemTableViewCell.reuseIdentifier, for: indexPath) as? LocationItemTableViewCell else {
            return UITableViewCell()
        }
        let viewModel = viewModel.getLocationItemViewModel(row: indexPath.row)
        cell.configData(viewModel: viewModel)
        return cell
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.tableFooterView?.isHidden = viewModel.isLastPage
    }
}

// MARK: - Extensions
extension LocationsViewController: MessageDisplayable { }
