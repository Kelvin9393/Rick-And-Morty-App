//
//  UIImageView+Utils.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 08/01/2024.
//

import UIKit

extension UIImageView {
    func setImageFromData(data: Data?) {
        if let data = data {
            if let image = UIImage(data: data) {
                self.image = image
            }
        }
    }

    func addDefaultImage() {
        image = UIImage(named: Images.defaultImage)
    }
}
