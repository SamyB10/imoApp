//
//  RestModelCommunes.swift
//  ImoApp
//
//  Created by Boussair Samy on 16/08/2024.
//

import Foundation
public struct RestModelCity: Decodable, Equatable {
    let name: String?
    let key: String?
    let keyDepartment: String?
    let keyRegion: String?
    let postalCode: [String]?

    private enum CodingKeys: String, CodingKey {
        case name = "nom"
        case key = "code"
        case keyDepartment = "codeDepartement"
        case keyRegion = "codeRegion"
        case postalCode = "codesPostaux"
    }
}
