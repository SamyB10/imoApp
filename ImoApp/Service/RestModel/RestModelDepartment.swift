//
//  RestModelDepartment.swift
//  ImoApp
//
//  Created by Boussair Samy on 16/08/2024.
//
import Foundation
public struct RestModelDepartment: Decodable, Equatable {
    let name: String?
    let key: String?
    let keyRegion: String?

    private enum CodingKeys: String, CodingKey {
        case name = "nom"
        case key = "code"
        case keyRegion = "codeRegion"
    }
}
