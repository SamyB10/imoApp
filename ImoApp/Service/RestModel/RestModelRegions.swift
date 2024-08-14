//
//  BusinnesModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 14/08/2024.
//

import Foundation

import Foundation

public struct RestModelRegions: Decodable {
    let name: String?
    let id: String?

    private enum CodingKeys: String, CodingKey {
        case name = "nom"
        case id = "code"
    }
}
