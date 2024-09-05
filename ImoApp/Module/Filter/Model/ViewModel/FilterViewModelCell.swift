//
//  FilterViewModelCell.swift
//  ImoApp
//
//  Created by Boussair Samy on 30/08/2024.
//

import Foundation
extension FilterViewModel {
    struct Cell: Hashable, Equatable {
        let apperance: Apperance
    }

    enum Apperance: Hashable, Equatable {
        case picker([Picker])
        case toggle(Toggle)
//        case textField(TextField)
        case slider(Slider)
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
        case twoBedroom(Bool, isDisabled: Bool)
        case threeBedroom(Bool, isDisabled: Bool)
        case fourBedroom(Bool, isDisabled: Bool)
        case fiveOrMoreBedroom(Bool, isDisabled: Bool)


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
            case let .twoBedroom(value, _):
                    .twoBedroom(value)
            case let .threeBedroom(value, _):
                    .threeBedroom(value)
            case let .fourBedroom(value, _):
                    .fourBedroom(value)
            case let .fiveOrMoreBedroom(value, _):
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
                    .twoBedroom(let value, _),
                    .threeBedroom(let value, _),
                    .fourBedroom(let value, _),
                    .fiveOrMoreBedroom(let value, _):
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
                    .twoBedroom(let value, _),
                    .threeBedroom(let value, _),
                    .fourBedroom(let value, _),
                    .fiveOrMoreBedroom(let value, _):
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
    }
}

extension FilterViewModel {
    enum TextField: Hashable, Equatable {
        case minPrice(Double, Double)
        case maxPrice(Double, Double)
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

//        var viewModel: TextFieldViewModel {
//            switch self {
//            case .minPrice(let min, _):
//                TextFieldViewModel(cell: self,
//                                   title: title,
//                                   text: numberFormatter(with: String(min)))
//            case .maxPrice(_, let max):
//                TextFieldViewModel(cell: self,
//                                   title: title,
//                                   text: numberFormatter(with: String(max)))
//            case .minAreaSquareMeter(let areaSquareMeter),
//                    .maxAreaSquareMeter(let areaSquareMeter):
//                TextFieldViewModel(cell: self,
//                                   title: title,
//                                   text: areaSquareMeter)
//            }
//        }

        func selectedItem(with value: Double) -> SelectedFilterItem {
            switch self {
            case .minPrice(let min, let max):
                    .minPrice(value, max)
            case .maxPrice(let min, let max):
                    .maxPrice(min, value)
            case .minAreaSquareMeter:
                    .minAreaSquareMeter(String(value))
            case .maxAreaSquareMeter:
                    .maxAreaSquareMeter(String(value))
            }
        }

        private func numberFormatter(with value: String) -> String {
            if let number = Double(value) {
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                formatter.groupingSeparator = " "
                formatter.groupingSize = 3
                return formatter.string(from: NSNumber(value: number)) ?? value
            }
            return value
        }
    }
}

extension FilterViewModel {
    enum Slider: Hashable, Equatable {
        case minPrice(min: Double, max: Double)
        case maxPrice(min: Double, max: Double, maxRange: Double)
        case localisation(range: Double)

        var title: String {
            switch self {
            case .minPrice:
                "Prix Minimum"
            case .maxPrice:
                "Prix Maximum"
            case .localisation:
                "Localisation"
            }
        }

        var sliderViewModel: SliderViewModel {
            switch self {
            case let .minPrice(min, max):
                SliderViewModel(appearance: .minPrice,
                                title: title,
                                priceMin: min,
                                priceMax: max,
                                localisation: 0.0)
            case let .maxPrice(min, max, maxRange):
                SliderViewModel(appearance: .maxPrice(maxRange: maxRange),
                                title: title,
                                priceMin: min,
                                priceMax: max,
                                localisation: 0.0,
                                maxRange: maxRange)
            case let .localisation(range):
                SliderViewModel(appearance: .localisation,
                                title: title,
                                priceMin: 0.0,
                                priceMax: 0.0,
                                localisation: range)

            }
        }

        var textFieldViewModel: TextFieldViewModel {
            switch self {
            case let .minPrice(min, _):
                TextFieldViewModel(prompt: "0",
                                   text: "\(Int(min).formatted(.number)) €")
            case let .maxPrice(_, max, _):
                TextFieldViewModel(prompt: "0",
                                   text: "\(Int(max).formatted(.number)) €")
            case let .localisation(range):
                TextFieldViewModel(prompt: "0",
                                   text: range.formatted())

            }
        }

        func selectedItem(with value: Double) -> SelectedFilterItem {
            switch self {
            case let .minPrice(_, max):
                    .minPrice(value, max)
            case let .maxPrice(min, _, _):
                    .maxPrice(min, value)
            case let .localisation(range):
                    .localisation(range)
            }
        }
    }
}
