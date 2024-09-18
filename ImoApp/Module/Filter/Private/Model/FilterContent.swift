//
//  FilterContent.swift
//  ImoApp
//
//  Created by Boussair Samy on 27/08/2024.
//

import Foundation
public struct FilterContent: Equatable {
    var order: Order
    var property: Property
    var studio: Bool
    var oneRoom: Bool
    var twoRoom: Bool
    var threeRoom: Bool
    var fourRoom: Bool
    var fiveOrMoreRoom: Bool
    var priceMin: Int
    var priceMax: Int
    let maxPriceSlideRange: Double
    var oneBedRoom: Bool
    var twoBedRoom: Bool
    var threeBedRoom: Bool
    var fourBedRoom: Bool
    var fiveOrMoreBedRoom: Bool
    var localisation: Double
    var buildBefore1950: Bool
    var buildBetwen1950And2000: Bool
    var buildAfter2000: Bool
    var minAreaSquareMeter: Int
    var maxAreaSquareMeter: Int
    var a: Bool
    var b: Bool
    var c: Bool
    var d: Bool
    var e: Bool
    var f: Bool
    var g: Bool
}

extension FilterContent {
    public struct Property: Equatable {
        let type: TypeProperty
    }

    public struct Order: Equatable {
        let type: TypeOrder
    }
}

extension FilterContent {
    public enum TypeProperty: Equatable {
        case appartment
        case house
        case both
    }

    public enum TypeOrder: Equatable {
        case orderPerDateAsc
        case orderPerDateDesc
        case orderPricePerMeterAsc
        case orderPricePerMeterDesc
        case orderPriceAsc
        case orderPriceDesc
        case orderSurfaceAsc
        case orderSurfaceDesc
    }
}
