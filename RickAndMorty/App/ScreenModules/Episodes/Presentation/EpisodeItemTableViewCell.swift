//
//  EpisodeItemTableViewCell.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 24/01/2024.
//

import UIKit

final class EpisodeItemTableViewCell: UITableViewCell {

    // MARK: - Private Properties
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    private lazy var episodeNumberLabel = makeCustomPaddingLabel()
    private lazy var airDateLabel = makeCustomPaddingLabel()
    private lazy var seasonAndEpisodeLabel = makeCustomPaddingLabel()

    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers
    public func configData(viewModel: EpisodeItemViewModel) {
        nameLabel.text = viewModel.name
        episodeNumberLabel.text = viewModel.episodeNumber
        airDateLabel.text = viewModel.episode.airDate
        seasonAndEpisodeLabel.text = viewModel.seasonAndEpisode
    }

    private func configUI() {
        let containerTagsStackView = UIStackView(arrangedSubviews: [
            episodeNumberLabel,
            airDateLabel,
            seasonAndEpisodeLabel,
            UIView()
        ])
        containerTagsStackView.spacing = 4

        let mainContainerStackView = UIStackView(arrangedSubviews: [
            nameLabel,
            containerTagsStackView
        ])
        mainContainerStackView.axis = .vertical
        mainContainerStackView.spacing = 5

        addSubview(mainContainerStackView)
        mainContainerStackView.setConstraints(
            top: topAnchor,
            right: rightAnchor,
            bottom: bottomAnchor,
            left: leftAnchor,
            pTop: 10,
            pRight: 10,
            pBottom: 10,
            pLeft: 20)
    }

    private func makeCustomPaddingLabel() -> UILabel {
        let label = CustomPaddingLabel()
        label.backgroundColor = .systemBlue
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.edgeInsets = .init(top: 2, left: 10, bottom: 2, right: 10)
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.textColor = .white
        return label
    }
}

extension EpisodeItemTableViewCell: Reusable { }
