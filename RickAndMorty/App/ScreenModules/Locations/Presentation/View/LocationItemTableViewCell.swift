//
//  LocationItemTableViewCell.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 21/01/2024.
//

import UIKit

final class LocationItemTableViewCell: UITableViewCell {
    // MARK: - Private Properties
    private lazy var nameLabel = makeLabels(forTextStyle: .headline)
    private lazy var dimensionLabel = makeLabels(forTextStyle: .subheadline)
    private lazy var typeLabel = makeLabels(forTextStyle: .footnote)

    // MARK: - Lifecyle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configUI() {
        selectionStyle = .none

        let stack = UIStackView(arrangedSubviews: [
            nameLabel,
            dimensionLabel,
            typeLabel
        ])
        stack.axis = .vertical
        stack.spacing = ViewValues.smallPadding

        addSubview(stack)
        stack.setConstraints(
            top: topAnchor,
            right: rightAnchor,
            bottom: bottomAnchor,
            left: leftAnchor,
            pTop: ViewValues.normalPadding,
            pRight: ViewValues.normalPadding,
            pBottom: ViewValues.normalPadding,
            pLeft: ViewValues.doublePadding)
    }

    public func configData(viewModel: LocationItemViewModel) {
        nameLabel.text = viewModel.name
        dimensionLabel.text = viewModel.dimension
        typeLabel.text = viewModel.type
    }

    private func makeLabels(forTextStyle textStyle: UIFont.TextStyle) -> UILabel {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: textStyle)
        return label
    }
}

extension LocationItemTableViewCell: Reusable { }
