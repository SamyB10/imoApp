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
    case minPrice(Double, Double)
    case maxPrice(Double, Double)
    case minAreaSquareMeter(String)
    case maxAreaSquareMeter(String)
    case localisation(Double)
}
