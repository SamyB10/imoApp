//
//  FilterViewModelCellSlider.swift
//  ImoApp
//
//  Created by Boussair Samy on 06/09/2024.
//

import Foundation
extension FilterViewModel {
    enum Slider: Hashable, Equatable {
        case price(min: Int, max: Int)
        case areaSquareMeter(min: Int, max: Int)
        case localisation(range: Double)

        var title: String {
            switch self {
            case .localisation:
                "Localisation"
            case .price:
                "Prix"
            case .areaSquareMeter:
                "Surface du bien"
            }
        }

        var sliderViewModel: SliderViewModel {
            switch self {
            case let .localisation(range):
                SliderViewModel(appearance: .localisation(range),
                                title: title)
            case let .price(min, max):

                SliderViewModel(appearance: .price(min, max),
                                title: title)
            case let .areaSquareMeter(min, max):
                SliderViewModel(appearance: .areaSquareMeter(min, max),
                                title: title)
            }
        }

        enum TextFieldValue {
            case min
            case max
        }

        func textFieldViewModel(with value: TextFieldValue) -> TextFieldViewModel {
            switch self {
            case let .localisation(range):
                return TextFieldViewModel(apperance: .localisation,
                                          prompt: "0",
                                          text: Int(range))

            case let .price(min, max):
                switch value {
                case .min:
                    return TextFieldViewModel(apperance: .price,
                                              prompt: "0",
                                              text: min)
                case .max:
                    return TextFieldViewModel(apperance: .price,
                                              prompt: "0",
                                              text: max)
                }
            case let .areaSquareMeter(min, max):
                switch value {
                case .min:
                    return TextFieldViewModel(apperance: .areaSquareMeter,
                                              prompt: "0",

                                              text: min)
                case .max:
                    return TextFieldViewModel(apperance: .areaSquareMeter,
                                              prompt: "0",

                                              text: max)
                }
            }
        }

        enum TextFieldSelected {
            case min(value: Int)
            case max(value: Int)
            case localisation(value: Double)
        }

        func selectedItem(with value: TextFieldSelected) -> SelectedFilterItem? {
            switch self {
            case .localisation:
                guard case let .localisation(distance) = value else { return nil }
                return .localisationDistance(distance)
            case let .price(min, max):
                switch value {
                case let .min(price):
                    return .priceSlider(price, max)
                case let .max(price):
                    return .priceSlider(min, price)
                default:
                    return nil
                }
            case let .areaSquareMeter(min, max):
                switch value {
                case let .min(area):
                    return .areaSquareSlider(area, max)
                case let .max(area):
                    return .areaSquareSlider(min, area)
                default:
                    return nil
                }
            }
        }
    }
}
