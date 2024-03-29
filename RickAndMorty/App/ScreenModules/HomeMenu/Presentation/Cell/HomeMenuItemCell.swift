//
//  HomeMenuItemCell.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 26/12/2023.
//

import UIKit

class HomeMenuItemCell: UICollectionViewCell {

    // MARK: - Private Properties
    private let mainContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        view.layer.cornerRadius = ViewValues.defaultCornerRadius
        view.layer.masksToBounds = true
        return view
    }()

    private let categoryMenuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Images.defaultImage)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let titleCategoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configUI() {
        addSubview(mainContainer)
        mainContainer.fillSuperView(widthPadding: ViewValues.normalPadding)

        mainContainer.addSubview(categoryMenuImageView)
        categoryMenuImageView.fillSuperView()

        configGradientForTitle()

        mainContainer.addSubview(titleCategoryLabel)
        titleCategoryLabel.setConstraints(right: mainContainer.rightAnchor,
                                          bottom: mainContainer.bottomAnchor,
                                          left: mainContainer.leftAnchor,
                                          pRight: ViewValues.normalPadding,
                                          pBottom: ViewValues.normalPadding,
                                          pLeft: ViewValues.normalPadding)
    }

    private func configGradientForTitle() {
        let gradientMaskLayer = CAGradientLayer()
        gradientMaskLayer.frame = bounds
        gradientMaskLayer.colors = [UIColor.clear.cgColor, UIColor.darkGray.cgColor]
        gradientMaskLayer.locations = [ViewValues.gradientTitleStart, ViewValues.gradientTitleEnd]
        mainContainer.layer.addSublayer(gradientMaskLayer)
    }

    func configData(viewModel: HomeMenuItemViewModel) {
        titleCategoryLabel.text = viewModel.title
        categoryMenuImageView.image = UIImage(named: viewModel.imageName)
    }
}

extension HomeMenuItemCell: Reusable {}
