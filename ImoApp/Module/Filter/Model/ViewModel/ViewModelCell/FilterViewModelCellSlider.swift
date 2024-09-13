//
//  FilterViewModelCellSlider.swift
//  ImoApp
//
//  Created by Boussair Samy on 06/09/2024.
//

import Foundation
extension FilterViewModel {
    enum Slider: Hashable, Equatable {
        case price(min: Double, max: Double)
        case localisation(range: Double)

        var title: String {
            switch self {
            case .localisation:
                "Localisation"
            case .price:
                "Prix"
            }
        }

        var sliderViewModel: SliderViewModel {
            switch self {
            case let .localisation(range):
                SliderViewModel(appearance: .localisation,
                                title: title,
                                priceMin: 0,
                                priceMax: 0.0,
                                localisation: range)
            case .price(min: let min, max: let max):
                SliderViewModel(appearance: .localisation,
                                title: title,
                                priceMin: min,
                                priceMax: max,
                                localisation: 0.0)
            }
        }

        private func numberFormatter(with value: Double) -> Double {
            let a = floor(value)
            return a


        }

        func textFieldViewModel(for minPrice: Bool) -> TextFieldViewModel {
            switch self {
            case let .localisation(range):
                return TextFieldViewModel(prompt: "0",
                                          text: Int(range))

            case let .price(min, max):
                return minPrice ?
                TextFieldViewModel(prompt: "0", text: Int(min))
                : TextFieldViewModel(prompt: "0", text: Int(max))
            }
        }

        func selectedItem(with value: Double) -> SelectedFilterItem {
            switch self {
            case let .localisation(range):
                    .localisation(range)
            case .price(min: let min, max: let max):
                    .priceSlider(Int(min), Int(max))
            }
        }
    }
}
