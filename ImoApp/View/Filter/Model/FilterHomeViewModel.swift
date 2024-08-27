//
//  FilterModel.swift
//  ImoApp
//
//  Created by Boussair Samy on 23/08/2024.
//

public struct FilterViewModel: Hashable, Equatable {
    let sections: [Section]

    struct Section: Hashable, Equatable {
        let header: String
        let cells: TypeCell
    }
}

extension FilterViewModel {
    enum TypeCell: Hashable, Equatable {
        case picker([Picker])
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
                "Les 2"
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
