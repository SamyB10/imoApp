//
//  FilterContent.swift
//  ImoApp
//
//  Created by Boussair Samy on 27/08/2024.
//

import Foundation
public struct FilterContent: Equatable {
    var property: Property
    var studio: Bool
    var oneRoom: Bool
    var twoRoom: Bool
    var threeRoom: Bool
    var fourRoom: Bool
    var fiveOrMoreRoom: Bool
    var priceMin: Double
    var priceMax: Double
    var oneBedRoom: Bool
    var twoBedRoom: Bool
    var threeBedRoom: Bool
    var fourBedRoom: Bool
    var fiveOrMoreBedRoom: Bool
}

extension FilterContent {
    public struct Property: Equatable {
        let type: TypeProperty
    }
}

extension FilterContent {
    public enum TypeProperty: Equatable {
        case appartment
        case house
        case both
    }
}
