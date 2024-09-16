//
//  FilterViewModelCellTextField.swift
//  ImoApp
//
//  Created by Boussair Samy on 06/09/2024.
//
import Foundation

extension FilterViewModel {
    enum TextField: Hashable, Equatable {
        case minPrice(Int, Int)
        case maxPrice(Int, Int)
        case minAreaSquareMeter(Int?)
        case maxAreaSquareMeter(Int?)
        case minAreaSquareMeterField(Int?)
        case maxAreaSquareMeterField(Int?)


        var title: String {
            switch self {
            case .minAreaSquareMeter,
                    .minAreaSquareMeterField:
                "Surface Minimum"
            case .maxAreaSquareMeter,
                    .maxAreaSquareMeterField:
                "Surface Maximum"
            case .minPrice:
                "Minimum"
            case .maxPrice:
                "Maximum"
            }
        }

        func selectedItem() -> SelectedFilterItem {
            switch self {
            case let .minAreaSquareMeter(value):
                    .minAreaSquareMeter(value ?? 0)
            case let .maxAreaSquareMeter(value):
                    .maxAreaSquareMeter(value ?? 0)
            case let .minAreaSquareMeterField(value):
                    .minAreaSquareMeterField(value ?? 0)
            case let .maxAreaSquareMeterField(value):
                    .maxAreaSquareMeterField(value ?? 0)
            case let .minPrice(min, max):
                    .minPrice(min, max)
            case let .maxPrice(min, max):
                    .maxPrice(min, max)
            }
        }

        func viewModel() -> TextFieldViewModel {
            switch self {
            case let .minAreaSquareMeter(value):
                TextFieldViewModel(apperance: .areaSquareMeter,
                                   prompt: title,
                                   text: value == 0 ? nil : value)
            case let .maxAreaSquareMeter(value):
                TextFieldViewModel(apperance: .areaSquareMeter,
                                   prompt: title,
                                   text: value == 0 ? nil : value)
            case let .minAreaSquareMeterField(value):
                TextFieldViewModel(apperance: .areaSquareMeter,
                                   prompt: title,
                                   text: value == 0 ? nil : value)
            case let .maxAreaSquareMeterField(value):
                TextFieldViewModel(apperance: .areaSquareMeter,
                                   prompt: title,
                                   text: value == 0 ? nil : value)
            case let .minPrice(min, _):
                TextFieldViewModel(apperance: .price,
                                   prompt: title,
                                   text: min)
            case let .maxPrice(_, max):
                TextFieldViewModel(apperance: .price,
                                   prompt: title,
                                   text: max)
            }
        }
    }
}
