//
//  SpinnerDisplayable.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 29/12/2023.
//

import UIKit

protocol SpinnerDisplayable: AnyObject {
    func showSpinner()
    func hideSpinner()
}

extension SpinnerDisplayable where Self: UIViewController {
    func showSpinner() {
        guard doesNotExistAnotherSpinner else { return }
        configureSpinner()
    }

    private func configureSpinner() {
        let containerView = UIView()
        containerView.tag = ViewValues.tagIdentifierSpinner
        parentView.addSubview(containerView)
        containerView.fillSuperView()
        containerView.backgroundColor = .black.withAlphaComponent(ViewValues.opacityContainerSpinner)
        addSpinnerIndicatorToContainer(container: containerView)
    }

    private func addSpinnerIndicatorToContainer(container: UIView) {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.startAnimating()
        container.addSubview(spinner)
        spinner.centerXY()
    }

    func hideSpinner() {
        if let foundView = parentView.viewWithTag(ViewValues.tagIdentifierSpinner) {
            foundView.removeFromSuperview()
        }
    }

    private var doesNotExistAnotherSpinner: Bool {
        parentView.viewWithTag(ViewValues.tagIdentifierSpinner) == nil
    }

    private var parentView: UIView {
        navigationController?.view ?? view
    }
}
