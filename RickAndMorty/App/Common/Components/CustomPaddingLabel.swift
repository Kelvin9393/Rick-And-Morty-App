//
//  CustomPaddingLabel.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 24/01/2024.
//

import UIKit

final class CustomPaddingLabel: UILabel {
    var edgeInsets: UIEdgeInsets = .zero

    override func draw(_ rect: CGRect) {
        let insets = UIEdgeInsets(
            top: edgeInsets.top,
            left: edgeInsets.left,
            bottom: edgeInsets.bottom,
            right: edgeInsets.right)
        super.drawText(in: rect.inset(by: edgeInsets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(
            width: size.width + edgeInsets.left + edgeInsets.right,
            height: size.height + edgeInsets.top + edgeInsets.bottom)
    }
}
