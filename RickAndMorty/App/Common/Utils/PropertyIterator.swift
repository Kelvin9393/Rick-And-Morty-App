//
//  PropertyIterator.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 29/12/2023.
//

protocol PropertyIterator {

}

extension PropertyIterator {
    func dictionaryProperties() -> [String: Any] {
        let mirror = Mirror(reflecting: self)
        var dictionary = [String: Any]()
        mirror.children.forEach { property in
            dictionary[property.label ?? String()] = property.value
        }
        return dictionary
    }
}
