//
//  FilterViewModelCell.swift
//  ImoApp
//
//  Created by Boussair Samy on 30/08/2024.
//

import Foundation
extension FilterViewModel {
    enum Picker: Hashable, Equatable {
        case appartment(Bool)
        case house(Bool)
        case both(Bool)

        var title: String {
            switch self {
            case .appartment:
                "Appartement"
            case .house:
                "Maison"
            case .both:
                "Tous types"
            }
        }

        func selectedItem() -> SelectedFilterItem {
            switch self {
            case let .appartment(value):
                    .appartment(value)
            case let .house(value):
                    .house(value)
            case let .both(value):
                    .both(value)
            }
        }

        func currentState() -> Bool {
            switch self {
            case .appartment(let value),
                    .house(let value),
                    .both(let value):
                value
            }
        }
    }
}

extension FilterViewModel {
    enum Toggle: Hashable, Equatable {
        case studio(Bool)
        case one(Bool)
        case two(Bool)
        case three(Bool)
        case four(Bool)
        case fiveOrMore(Bool)
        case oneBedroom(Bool, isDisabled: Bool)
        case twoBedroom(Bool)
        case threeBedroom(Bool)
        case fourBedroom(Bool)
        case fiveOrMoreBedroom(Bool)


        var title: String {
            switch self {
            case .studio:
                "Studio"
            case .one,
                    .oneBedroom:
                "1"
            case .two,
                    .twoBedroom:
                "2"
            case .three,
                    .threeBedroom:
                "3"
            case .four,
                    .fourBedroom:
                "4"
            case .fiveOrMore,
                    .fiveOrMoreBedroom:
                "5 +"
            }
        }

        func selectedItem(with state: Bool) -> SelectedFilterItem {
            switch self {
            case .studio:
                    .studio(!state)
            case .one:
                    .one(!state)
            case .two:
                    .two(!state)
            case .three:
                    .three(!state)
            case .four:
                    .four(!state)
            case .fiveOrMore:
                    .fiveOrMore(!state)
            case let .oneBedroom(value, _):
                    .oneBedroom(value)
            case let .twoBedroom(value):
                    .twoBedroom(value)
            case let .threeBedroom(value):
                    .threeBedroom(value)
            case let .fourBedroom(value):
                    .fourBedroom(value)
            case let .fiveOrMoreBedroom(value):
                    .fiveOrMoreBedroom(value)
            }
        }

        func viewModel() -> ToggleViewModel {
            switch self {
            case .studio(let value),
                    .one(let value),
                    .two(let value),
                    .three(let value),
                    .four(let value),
                    .fiveOrMore(let value),
                    .oneBedroom(let value, _),
                    .twoBedroom(let value),
                    .threeBedroom(let value),
                    .fourBedroom(let value),
                    .fiveOrMoreBedroom(let value):
                ToggleViewModel(apperance: .button,
                                title: title,
                                isOn: value)
            }
        }

        func currentState() -> Bool {
            switch self {
            case .studio(let value),
                    .one(let value),
                    .two(let value),
                    .three(let value),
                    .four(let value),
                    .fiveOrMore(let value),
                    .oneBedroom(let value, _),
                    .twoBedroom(let value),
                    .threeBedroom(let value),
                    .fourBedroom(let value),
                    .fiveOrMoreBedroom(let value):
                value
            }
        }

        var disabled: Bool {
            switch self {
            case .oneBedroom(_, let isDisabled):
                isDisabled
            default:
                false
            }
        }
    }
}

extension FilterViewModel {
    enum TextField: Hashable, Equatable {
        case minPrice(String)
        case maxPrice(String)
        case minAreaSquareMeter(String)
        case maxAreaSquareMeter(String)
        
        var title: String {
            switch self {
            case .minPrice:
                "Prix minimum"
            case .maxPrice:
                "Prix maximum"
            case .minAreaSquareMeter:
                "Surface minimum"
            case .maxAreaSquareMeter:
                "Surface maximum"
            }
        }
    }
}

extension FilterViewModel {
    enum Slider: Hashable, Equatable {
        case MaxSearchRadius(Double)

        var title: String {
            switch self {
            case .MaxSearchRadius:
                "Rayon de recherche Maximum"
            }
        }
    }
}
