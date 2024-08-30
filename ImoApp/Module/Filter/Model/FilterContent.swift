//
//  FilterContent.swift
//  ImoApp
//
//  Created by Boussair Samy on 27/08/2024.
//

import Foundation
public struct FilterContent: Hashable {
    var property: Property
    var studio: Bool
    var oneRoom: Bool
    var twoRoom: Bool
    var threeRoom: Bool
    var fourRoom: Bool
    var fiveOrMoreRoom: Bool
    var priceMin: Double
    var priceMax: Double
}

extension FilterContent {
    public struct Property: Hashable {
        let type: TypeProperty
    }
}

extension FilterContent {
    public enum TypeProperty: Hashable {
        case appartment
        case house
        case both
    }
}
