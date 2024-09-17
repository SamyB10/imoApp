//
//  FilterViewModelCell.swift
//  ImoApp
//
//  Created by Boussair Samy on 30/08/2024.
//

import Foundation
extension FilterViewModel {
    struct Cell: Hashable, Equatable {
        let appearance: Appearance
    }

    enum Appearance: Hashable, Equatable {
        case picker([Picker])
        case toggle(Toggle)
        case slider(Slider)
        case textField(TextField)
        case button(Button)
    }
}

extension FilterViewModel {
    enum Button: Equatable, Hashable {
        case energyPerformance(EnergyPerformance)

        var title: String {
            switch self {
            case let .energyPerformance(energyPerformance):
                switch energyPerformance {
                case .a:
                    "A"
                case .b:
                    "B"
                case .c:
                    "C"
                case .d:
                    "D"
                case .e:
                    "E"
                case .f:
                    "F"
                case .g:
                    "G"
                }
            }
        }

        var isSelected: Bool {
            switch self {
            case let .energyPerformance(energyPerformance):
                switch energyPerformance {
                case let .a(state):
                    state
                case let .b(state):
                    state
                case let .c(state):
                    state
                case let .d(state):
                    state
                case let .e(state):
                    state
                case let .f(state):
                    state
                case let .g(state):
                    state
                }
            }
        }
    }

    enum EnergyPerformance: Equatable, Hashable {
        case a(isSelected: Bool)
        case b(isSelected: Bool)
        case c(isSelected: Bool)
        case d(isSelected: Bool)
        case e(isSelected: Bool)
        case f(isSelected: Bool)
        case g(isSelected: Bool)
    }
}
