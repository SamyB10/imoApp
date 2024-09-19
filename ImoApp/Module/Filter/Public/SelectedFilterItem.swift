//
//  SelectedFilter.swift
//  ImoApp
//
//  Created by Boussair Samy on 27/08/2024.
//

import Foundation
public enum SelectedFilterItem {
    case appartment(Bool)
    case house(Bool)
    case both(Bool)
    case studio(Bool)
    case one(Bool)
    case two(Bool)
    case three(Bool)
    case four(Bool)
    case fiveOrMore(Bool)
    case oneBedroom(Bool)
    case twoBedroom(Bool)
    case threeBedroom(Bool)
    case fourBedroom(Bool)
    case fiveOrMoreBedroom(Bool)
    case priceSlider(Int, Int)
    case areaSquareSlider(Int, Int)
    case localisationDistance(Double)
    case buildBefore1950(Bool)
    case buildBetwen1950And2000(Bool)
    case buildAfter2000(Bool)
    case a(Bool)
    case b(Bool)
    case c(Bool)
    case d(Bool)
    case e(Bool)
    case f(Bool)
    case g(Bool)
    case orderPerDateAsc(Bool)
    case orderPerDateDesc(Bool)
    case orderPricePerMeterAsc(Bool)
    case orderPricePerMeterDesc(Bool)
    case orderPriceAsc(Bool)
    case orderPriceDesc(Bool)
    case orderSurfaceAsc(Bool)
    case orderSurfaceDesc(Bool)
}
