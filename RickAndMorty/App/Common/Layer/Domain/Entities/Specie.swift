//
//  Specie.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 31/12/2023.
//

import Foundation

enum Specie {
    case alien
    case human
    case other(type: String?)

    init(specie: String?) {
        switch specie {
        case AppLocalized.alien:
            self = .alien
        case AppLocalized.human:
            self = .human
        default:
            self = .other(type: specie)
        }
    }
}

extension Specie: CustomStringConvertible {
    var description: String {
        switch self {
        case .alien:
            return AppLocalized.specieAlien
        case .human:
            return AppLocalized.specieHuman
        case .other(let typeSpecie):
            return "\(AppLocalized.specie) \(String(describing: typeSpecie))"
        }
    }
}
