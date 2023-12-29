//
//  Reusable.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 26/12/2023.
//

import Foundation

protocol Reusable {}

extension Reusable {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
