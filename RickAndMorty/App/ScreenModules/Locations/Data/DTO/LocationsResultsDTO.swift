//
//  LocationsResultsDTO.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 20/01/2024.
//

import Foundation

struct LocationsResultsDTO: Decodable {
    let results: [LocationDTO]
    let info: InfoDTO
}
