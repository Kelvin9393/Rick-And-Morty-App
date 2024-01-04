//
//  BaseViewModel.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 03/01/2024.
//

import Combine

protocol BaseViewModel {
    var state: PassthroughSubject<StateController, Never> { get }
    func viewDidLoad()
}
