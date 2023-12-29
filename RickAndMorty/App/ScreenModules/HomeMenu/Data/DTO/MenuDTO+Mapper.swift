//
//  MenuDTO+Mapper.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 29/12/2023.
//

import Foundation

extension MenuDTO {
    func toDomain() -> [MenuItem] {
        return dictionaryProperties().map { dictionary in
            let title = dictionary.key
            let url = (dictionary.value as? String) ?? String()
            return MenuItem(title: title, url: url)
        }
    }
}
