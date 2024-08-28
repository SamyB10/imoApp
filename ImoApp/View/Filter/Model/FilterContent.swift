//
//  FilterContent.swift
//  ImoApp
//
//  Created by Boussair Samy on 27/08/2024.
//

import Foundation
public struct FilterContent: Hashable {
    var property: Property
    var numberOfRoom: NumberOfRoom

    func filterSection() -> [FilterViewModel.Section] {
        let header = FilterViewModel.Header.property
        var cellsProperty: FilterViewModel.TypeCell {
            .picker([
                .appartment(property.type == .appartment),
                .house(property.type == .house),
                .both(property.type == .both)
            ])
        }
        let sectionProperty = FilterViewModel.Section(header: header,
                                                      cells: cellsProperty)

        let headerNumberofRoom = FilterViewModel.Header.numberOfRoom
        var cellsNumberOfRoom: FilterViewModel.TypeCell {
            .toggle([
                .studio(ToggleViewModel(isOn: numberOfRoom.studio)),
                .one(ToggleViewModel(isOn: numberOfRoom.one)),
                .two(ToggleViewModel(isOn: numberOfRoom.two)),
                .three(ToggleViewModel(isOn: numberOfRoom.three)),
                .four(ToggleViewModel(isOn: numberOfRoom.four)),
                .fiveOrMore(ToggleViewModel(isOn: numberOfRoom.fiveOrMore))
            ])
        }
        let sectionNumberOfRoom = FilterViewModel.Section(header: headerNumberofRoom,
                                                          cells: cellsNumberOfRoom)
        return [sectionProperty,
                sectionNumberOfRoom]
    }
}

extension FilterContent {
    public struct Property: Hashable {
        let type: TypeProperty

        init(type: TypeProperty) {
            self.type = type
        }
    }

    public enum TypeProperty: Hashable {
        case appartment
        case house
        case both
    }
}

extension FilterContent {
    public struct NumberOfRoom: Hashable {
        let studio: Bool
        let one: Bool
        let two: Bool
        let three: Bool
        let four: Bool
        let fiveOrMore: Bool
    }
}


