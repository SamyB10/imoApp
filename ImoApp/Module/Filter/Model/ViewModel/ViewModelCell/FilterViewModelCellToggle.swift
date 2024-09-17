//
//  FilterViewModelCellToggle.swift
//  ImoApp
//
//  Created by Boussair Samy on 06/09/2024.
//

import Foundation
import SwiftUI
extension FilterViewModel {
    enum Toggle: Hashable, Equatable {
        case studio(Bool)
        case one(Bool)
        case two(Bool)
        case three(Bool)
        case four(Bool)
        case fiveOrMore(Bool)
        case oneBedroom(Bool, isDisabled: Bool)
        case twoBedroom(Bool, isDisabled: Bool)
        case threeBedroom(Bool, isDisabled: Bool)
        case fourBedroom(Bool, isDisabled: Bool)
        case fiveOrMoreBedroom(Bool, isDisabled: Bool)
        case buildBefore1950(Bool)
        case buildBetwen1950And2000(Bool)
        case buildAfter2000(Bool)
        case a(Bool)
        case b(Bool)
        case c(Bool)
        case d(Bool)
        case e(Bool)
        case f(Bool)
        case g(Bool)

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
            case .buildBefore1950:
                "Avant 1950"
            case .buildBetwen1950And2000:
                "1950 - 2000"
            case .buildAfter2000:
                "Après 2000"
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
            case let .twoBedroom(value, _):
                    .twoBedroom(value)
            case let .threeBedroom(value, _):
                    .threeBedroom(value)
            case let .fourBedroom(value, _):
                    .fourBedroom(value)
            case let .fiveOrMoreBedroom(value, _):
                    .fiveOrMoreBedroom(value)
            case let .buildBefore1950(value):
                    .buildBefore1950(value)
            case let .buildBetwen1950And2000(value):
                    .buildBetwen1950And2000(value)
            case let .buildAfter2000(value):
                    .buildAfter2000(value)
            case .a:
                    .a(!state)
            case .b:
                    .b(!state)
            case .c:
                    .c(!state)
            case .d:
                    .d(!state)
            case .e:
                    .e(!state)
            case .f:
                    .f(!state)
            case .g:
                    .g(!state)
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
                    .twoBedroom(let value, _),
                    .threeBedroom(let value, _),
                    .fourBedroom(let value, _),
                    .fiveOrMoreBedroom(let value, _),
                    .buildBefore1950(let value),
                    .buildBetwen1950And2000(let value),
                    .buildAfter2000(let value),
                    .a(let value),
                    .b(let value),
                    .c(let value),
                    .d(let value),
                    .e(let value),
                    .f(let value),
                    .g(let value):
                ToggleViewModel(apperance: .button,
                                title: title,
                                isOn: value,
                                theme: color)
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
                    .twoBedroom(let value, _),
                    .threeBedroom(let value, _),
                    .fourBedroom(let value, _),
                    .fiveOrMoreBedroom(let value, _),
                    .buildBefore1950(let value),
                    .buildBetwen1950And2000(let value),
                    .buildAfter2000(let value),
                    .a(let value),
                    .b(let value),
                    .c(let value),
                    .d(let value),
                    .e(let value),
                    .f(let value),
                    .g(let value):
                value
            }
        }

        var disabled: Bool {
            switch self {
            case .oneBedroom(_, let isDisabled):
                isDisabled
            case .twoBedroom(_, let isDisabled):
                isDisabled
            case .threeBedroom(_, let isDisabled):
                isDisabled
            case .fourBedroom(_, let isDisabled):
                isDisabled
            case .fiveOrMoreBedroom(_, let isDisabled):
                isDisabled
            default:
                false
            }
        }

        private var color: Color {
            switch self {
            case .a:
                Color.A
            case .b:
                Color.B
            case .c:
                Color.C
            case .d:
                Color.D
            case .e:
                Color.E
            case .f:
                Color.F
            case .g:
                Color.G
            default:
                Color.clear
            }
        }
    }
}
