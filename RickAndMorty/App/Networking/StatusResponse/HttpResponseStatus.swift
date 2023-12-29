//
//  HttpResponseStatus.swift
//  RickAndMorty
//
//  Created by KELVIN LING SHENG SIANG on 29/12/2023.
//

enum HttpResponseStatus {
    static let ok = 200...299
    static let clientError = 400...499
    static let serverError = 500...599
}
