//
//  UIView+Constraints.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 26/12/2023.
//

import UIKit

extension UIView {
    func setConstraints(
        top: NSLayoutYAxisAnchor? = nil,
        right: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        left: NSLayoutXAxisAnchor? = nil,
        pTop: CGFloat = .zero,
        pRight: CGFloat = .zero,
        pBottom: CGFloat = .zero,
        pLeft: CGFloat = .zero
    ) {
        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: pTop).isActive = true
        }

        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -pRight).isActive = true
        }

        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -pBottom).isActive = true
        }

        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: pLeft).isActive = true
        }
    }

    func fillSuperView(widthPadding: CGFloat = .zero) {
        guard let superview = superview else { return }
        setConstraints(top: superview.topAnchor,
                       right: superview.rightAnchor,
                       bottom: superview.bottomAnchor,
                       left: superview.leftAnchor,
                       pTop: widthPadding,
                       pRight: widthPadding,
                       pBottom: widthPadding,
                       pLeft: widthPadding)
    }

    func centerY() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }

    func centerX() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
    }

    func centerXY() {
        centerX()
        centerY()
    }
}
