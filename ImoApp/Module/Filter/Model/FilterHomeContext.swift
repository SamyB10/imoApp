//
//  FilterHomeContext.swift
//  ImoApp
//
//  Created by Boussair Samy on 24/08/2024.
//

import Foundation
struct FilterHomeContext: Equatable {
    private(set) var currentFilter: FilterContent?

    mutating func didReceive(content: FilterContent) {
        currentFilter = content
    }

    mutating func didReceive(item: SelectedFilterItem) {
        switch item {
        case .appartment:
            self.currentFilter?.property = FilterContent.Property(type: .appartment)
        case .house:
            self.currentFilter?.property = FilterContent.Property(type: .house)
        case .both:
            self.currentFilter?.property = FilterContent.Property(type: .both)
        case let .studio(value):
            self.currentFilter?.studio = value
        case let .one(value):
            self.currentFilter?.oneRoom = value
        case let .two(value):
            self.currentFilter?.twoRoom = value
        case let .three(value):
            self.currentFilter?.threeRoom = value
        case let .four(value):
            self.currentFilter?.fourRoom = value
        case let .fiveOrMore(value):
            self.currentFilter?.fiveOrMoreRoom = value
        case let .oneBedroom(value):
            self.currentFilter?.oneBedRoom = value
        case let .twoBedroom(value):
            self.currentFilter?.twoBedRoom = value
        case let .threeBedroom(value):
            self.currentFilter?.threeBedRoom = value
        case let .fourBedroom(value):
            self.currentFilter?.fourBedRoom = value
        case let .fiveOrMoreBedroom(value):
            self.currentFilter?.fiveOrMoreBedRoom = value
        }
    }

    private var sections: [FilterViewModel.Section] {
        guard let currentFilter else { return [] }
        let typeProperty = FilterViewModel.Section.typeProperty([
            .appartment(currentFilter.property.type == .appartment),
            .house(currentFilter.property.type == .house),
            .both(currentFilter.property.type == .both)
        ])

        let numberOfRoom = FilterViewModel.Section.numberOfRoom([
            .studio(currentFilter.studio),
            .two(currentFilter.twoRoom),
            .three(currentFilter.threeRoom),
            .four(currentFilter.fourRoom),
            .fiveOrMore(currentFilter.fiveOrMoreRoom)
        ])

        let numberOfBedRoom = FilterViewModel.Section.numberOfBedroom([
            .oneBedroom(currentFilter.oneBedRoom, isDisabled: isDisabled(with: .oneBedroom(currentFilter.oneBedRoom))),
            .twoBedroom(currentFilter.twoBedRoom, isDisabled: isDisabled(with: .twoBedroom(currentFilter.twoRoom))),
            .threeBedroom(currentFilter.threeBedRoom, isDisabled: isDisabled(with: .threeBedroom(currentFilter.threeRoom))),
            .fourBedroom(currentFilter.fourBedRoom, isDisabled: isDisabled(with: .fourBedroom(currentFilter.fourRoom))),
            .fiveOrMoreBedroom(currentFilter.fiveOrMoreBedRoom, isDisabled: isDisabled(with: .fiveOrMoreBedroom(currentFilter.fiveOrMoreRoom)))
        ])

        let price = FilterViewModel.Section.price([
            .minPrice("Hey"),
            .maxPrice("Hey")
        ])

        return [
            typeProperty,
            numberOfRoom,
            numberOfBedRoom,
            price
        ]
    }

    var viewModel: FilterViewModel {
        FilterViewModel(sections: sections)
    }
}


// TODO: Refacto
extension FilterHomeContext {
    private func isDisabled(with item: SelectedFilterItem) -> Bool {
        switch item {
        case .oneBedroom:
            if currentFilter?.studio == true {
                if currentFilter?.twoRoom == true ||
                    currentFilter?.threeRoom == true ||
                    currentFilter?.fourRoom == true ||
                    currentFilter?.fiveOrMoreRoom == true {
                    false
                } else {
                    true
                }
            } else {
                false
            }
        case .twoBedroom:
            if currentFilter?.studio == true
                || currentFilter?.twoRoom == true {
                if currentFilter?.threeRoom == true ||
                    currentFilter?.fourRoom == true ||
                    currentFilter?.fiveOrMoreRoom == true {
                    false
                } else {
                    true
                }
            } else {
                false
            }
        case .threeBedroom:
            if currentFilter?.studio == true
                || currentFilter?.twoRoom == true
                || currentFilter?.threeRoom == true {
                if currentFilter?.fourRoom == true
                    || currentFilter?.fiveOrMoreRoom == true {
                    false
                } else {
                    true
                }
            } else {
                false
            }
        case .fourBedroom:
            if currentFilter?.studio == true
                || currentFilter?.twoRoom == true
                || currentFilter?.threeRoom == true
                || currentFilter?.fourRoom == true {
                if currentFilter?.fiveOrMoreRoom == true {
                    false
                } else {
                    true
                }
            } else {
                false
            }
        case .fiveOrMoreBedroom:
            if currentFilter?.fiveOrMoreRoom == true {
                false
            } else if currentFilter?.studio == true ||
                        currentFilter?.twoRoom == true ||
                        currentFilter?.threeRoom == true ||
                        currentFilter?.fourRoom == true {
                true
            } else {
                false
            }
        default:
            false
        }
    }
}
