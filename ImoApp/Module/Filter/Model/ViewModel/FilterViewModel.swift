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

        var displaySepartionBarTop: CGFloat {
            switch headerApperance {
            case .typeProperty:
                10
            default:
                0
            }
        }

        var displaySepartionBar: Bool {
            switch headerApperance {
            case .typeProperty,
                    .builYear,
                    .numberOfBedroom,
                    .areaSquareMeter,
                    .localisation,
                    .enery,
                    .price:
                true
            case .numberOfRoom:
                false
            }
        }
    }
}
