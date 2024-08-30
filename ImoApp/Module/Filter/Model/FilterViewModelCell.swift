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

        var title: String {
            switch self {
            case .studio:
                "Studio"
            case .one:
                "1"
            case .two:
                "2"
            case .three:
                "3"
            case .four:
                "4"
            case .fiveOrMore:
                "5 +"
            }
        }

        func selectedItem(with state: Bool) -> SelectedFilterItem {
            switch self {
            case let .studio(value):
                    .studio(state)
            case let .one(value):
                    .one(state)
            case let .two(value):
                    .two(state)
            case let .three(value):
                    .three(state)
            case let .four(value):
                    .four(state)
            case let .fiveOrMore(value):
                    .fiveOrMore(state)
            }
        }

        func viewModel() -> ToggleViewModel {
            switch self {
            case .studio(let value),
                    .one(let value),
                    .two(let value),
                    .three(let value),
                    .four(let value),
                    .fiveOrMore(let value):
                ToggleViewModel(isOn: value)
            }
        }

        func currentState() -> Bool {
            switch self {
            case .studio(let value),
                    .one(let value),
                    .two(let value),
                    .three(let value),
                    .four(let value),
                    .fiveOrMore(let value):
                value
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
