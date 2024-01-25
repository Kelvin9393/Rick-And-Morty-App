//
//  LocationItemViewModel.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 21/01/2024.
//

import Foundation

struct LocationItemViewModel {
    private(set) var location: Location

    var name: String {
        location.name
    }

    // TODO: - Remove strings and use AppLocalized
    var dimension: String {
        let safeDimension = location.dimension ?? AppLocalized.unknown
        return "Dimension: \(safeDimension)"
    }

    var type: String {
        let safeType = location.type ?? AppLocalized.unknown
        return "Type: \(safeType)"
    }
}
