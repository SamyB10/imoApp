//
//  FilterModelRefont.swift
//  ImoApp
//
//  Created by Boussair Samy on 30/08/2024.
//

import Foundation
struct FilterViewModel: Hashable, Equatable {
    let sections: [Section]
    let menuItemFilter: MenuItemFilter

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


extension FilterViewModel {
    struct MenuItemFilter: Hashable, Equatable {
        let section: [SectionMenuFilter]
    }

    struct SectionMenuFilter: Hashable, Equatable {
        let order: [Order]
    }

    enum Order: Hashable, Equatable {
        case orderPerDateAsc(Bool)
        case orderPerDateDesc(Bool)
        case orderPricePerMeterAsc(Bool)
        case orderPricePerMeterDesc(Bool)
        case orderPriceAsc(Bool)
        case orderPriceDesc(Bool)
        case orderSurfaceAsc(Bool)
        case orderSurfaceDesc(Bool)

        var title: String {
            switch self {
            case .orderPerDateAsc:
                "Du + récent au + ancien"
            case .orderPerDateDesc:
                "Du + ancien au + récent"
            case .orderPricePerMeterAsc:
                "Prix au m² croissant"
            case .orderPricePerMeterDesc:
                "Prix au m² décroissant"
            case .orderPriceAsc:
                "Prix croissant"
            case .orderPriceDesc:
                "Prix décroissant"
            case .orderSurfaceAsc:
                "Surface croissante"
            case .orderSurfaceDesc:
                "Surface décroissante"
            }
        }

        var currentState: Bool {
            switch self {
            case let.orderPerDateAsc(state):
                state
            case let.orderPerDateDesc(state):
                state
            case let.orderPricePerMeterAsc(state):
                state
            case let.orderPricePerMeterDesc(state):
                state
            case let.orderPriceAsc(state):
                state
            case let.orderPriceDesc(state):
                state
            case let.orderSurfaceAsc(state):
                state
            case let.orderSurfaceDesc(state):
                state
            }
        }

        var currentSelected: Bool {
            switch self {
            case .orderPerDateAsc(let state),
                    .orderPerDateDesc(let state),
                    .orderPricePerMeterAsc(let state),
                    .orderPricePerMeterDesc(let state),
                    .orderPriceAsc(let state),
                    .orderPriceDesc(let state),
                    .orderSurfaceAsc(let state),
                    .orderSurfaceDesc(let state):
                state
            }
        }
    }
}
