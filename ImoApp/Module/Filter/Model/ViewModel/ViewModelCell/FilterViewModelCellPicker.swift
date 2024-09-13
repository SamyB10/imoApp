//
//  FilterViewModelCellPicker.swift
//  ImoApp
//
//  Created by Boussair Samy on 06/09/2024.
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
