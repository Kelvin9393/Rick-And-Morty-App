//
//  CharacterItemTableViewCell.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 31/12/2023.
//

import UIKit

class CharacterItemTableViewCell: UITableViewCell {
    // MARK: - Private Properties
    private let mainContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        view.setHeightConstraint(with: ViewValues.defaultContainerCellHeight)
        view.layer.cornerRadius = ViewValues.defaultCornerRadius
        view.layer.masksToBounds = true
        return view
    }()

    private let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setWidthConstraint(with: ViewValues.defaultContainerCellHeight)
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: Images.defaultImage)
        return imageView
    }()

    private let labelContainerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline, compatibleWith: .init(legibilityWeight: .bold))
        label.textColor = .systemBlue
        label.text = "Rick"
        return label
    }()

    private let specieLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .callout)
        label.text = "Human"
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .callout)
        label.text = "🪦"
        return label
    }()

    // MARK: - Lifecyle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers
    private func configUI() {
        selectionStyle = .none
        
        addSubview(mainContainer)
        mainContainer.setConstraints(
            top: topAnchor,
            right: rightAnchor,
            bottom: bottomAnchor,
            left: leftAnchor,
            pRight: ViewValues.doublePadding,
            pBottom: ViewValues.doublePadding,
            pLeft: ViewValues.doublePadding)

        mainContainer.addSubview(characterImageView)
        characterImageView.setConstraints(
            top: mainContainer.topAnchor,
            bottom: mainContainer.bottomAnchor,
            left: mainContainer.leftAnchor)

        mainContainer.addSubview(labelContainerStackView)
        labelContainerStackView.setConstraints(
            top: mainContainer.topAnchor,
            right: mainContainer.rightAnchor,
            bottom: mainContainer.bottomAnchor,
            left: characterImageView.rightAnchor,
            pTop: ViewValues.normalPadding,
            pBottom: ViewValues.normalPadding,
            pLeft: ViewValues.normalPadding)

        [nameLabel, specieLabel, statusLabel].forEach {
            labelContainerStackView.addArrangedSubview($0)
        }
    }

    func configData(viewModel: CharacterItemViewModel) {
        nameLabel.text = viewModel.name
        specieLabel.text = viewModel.specie
        statusLabel.text = viewModel.status
    }
}

extension CharacterItemTableViewCell: Reusable { }
