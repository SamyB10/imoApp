//
//  FilterContent.swift
//  ImoApp
//
//  Created by Boussair Samy on 27/08/2024.
//

import Foundation
public struct FilterContent: Hashable {
    let property: Property

    func filterSection() -> [FilterViewModel.Section] {
        var cells: FilterViewModel.TypeCell {
            .picker([FilterViewModel.Picker.appartment(property.type == .appartment),
                     FilterViewModel.Picker.house(property.type == .house),
                     FilterViewModel.Picker.both(property.type == .both)])
        }
        let sectionPicker = FilterViewModel.Section(header: "Property",
                                                    cells: cells)
        return [sectionPicker]
    }
}

extension FilterContent {
    public struct Property: Hashable {
        public let type: TypeProperty

        public init(type: TypeProperty) {
            self.type = type
        }
    }

    public enum TypeProperty: Hashable {
        case appartment
        case house
        case both
    }
}

