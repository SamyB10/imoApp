//
//  FilterModelRefont.swift
//  ImoApp
//
//  Created by Boussair Samy on 30/08/2024.
//

import Foundation

public struct FilterViewModel: Hashable, Equatable {
    let sections: [Section]

    enum Section: Hashable, Equatable {
        case typeProperty([Picker])
        case numberOfRoom([Toggle])
        case price([TextField])
        case areaSquareMeter([TextField])
        case localisation([Slider])
    }
}
