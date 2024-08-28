//
//  FilterModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 23/08/2024.
//

public struct FilterViewModel: Hashable, Equatable {
    let sections: [Section]

    struct Section: Hashable, Equatable {
        let header: Header
        let cells: TypeCell
    }

    enum Header: String {
        case property = "Type de propriété"
        case numberOfRoom = "Nombre de Pièces"
    }
}

extension FilterViewModel {
    enum TypeCell: Hashable, Equatable {
        case picker([Picker])
        case toggle([Toggle])
    }

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

        var currentState: Bool {
            switch self {
            case .appartment(let value):
                value
            case .house(let value):
                value
            case .both(let value):
                value
            }
        }

        var selectedItem: SelectedFilterItem {
            switch self {
            case let .appartment(value):
                return .appartment(!value)
            case let .house(value):
                return .house(!value)
            case let .both(value):
                return .both(!value)
            }
        }
    }
}

extension FilterViewModel {
    enum Toggle: Hashable, Equatable {
        case studio(ToggleViewModel)
        case one(ToggleViewModel)
        case two(ToggleViewModel)
        case three(ToggleViewModel)
        case four(ToggleViewModel)
        case fiveOrMore(ToggleViewModel)

        var title: String {
            switch self {
            case .studio:
                "Studio"
            case .one:
                "1 pièce"
            case .two:
                "2 pièces"
            case .three:
                "3 pièces"
            case .four:
                "4 pièces"
            case .fiveOrMore:
                "5 pièces ou plus"
            }
        }

        var currentState: Bool {
            switch self {
            case .studio(let value),
                    .one(let value),
                    .two(let value),
                    .three(let value),
                    .four(let value),
                    .fiveOrMore(let value):
                value.isOn
            }
        }

        var viewModel: ToggleViewModel {
            switch self {
            case .studio(let toggleViewModel),
                    .one(let toggleViewModel),
                    .two(let toggleViewModel),
                    .three(let toggleViewModel),
                    .four(let toggleViewModel),
                    .fiveOrMore(let toggleViewModel):
                toggleViewModel
            }
        }

        var selectedItem: SelectedFilterItem {
            switch self {
            case let .studio(value):
                return .studio(value.isOn)
            case let .one(value):
                return .one(value.isOn)
            case let .two(value):
                return .two(value.isOn)
            case let .three(value):
                return .three(value.isOn)
            case let .four(value):
                return .four(value.isOn)
            case let .fiveOrMore(value):
                return .fiveOrMore(value.isOn)
            }
        }
    }
}
