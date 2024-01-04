//
//  UITableViewController+SpinnerLast.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 03/01/2024.
//

import UIKit

extension UITableViewController {
    func addSpinnerLastCell() {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.startAnimating()
        spinner.frame = .init(
            origin: .zero,
            size: .init(width: tableView.bounds.width,
                        height: ViewValues.defaultCellHeight)
        )
        tableView.tableFooterView = spinner
    }
}

