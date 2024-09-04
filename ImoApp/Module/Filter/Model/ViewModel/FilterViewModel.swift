//
//  FilterModelRefont.swift
//  ImoApp
//
//  Created by Boussair Samy on 30/08/2024.
//

import Foundation

public struct FilterViewModel: Hashable, Equatable {
    let sections: [Section]

    struct Section: Hashable, Equatable  {
        let headerApperance: HeaderApperance
        let cells: [Cell]

        var displaySepartionBar: Bool {
            switch headerApperance {
            case .typeProperty,
                    .numberOfBedroom,
                    .price,
                    .areaSquareMeter,
                    .localisation:
                true
            case .numberOfRoom:
                false
            }
        }
    }
}
