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
        case let .minPrice(min, _):
            self.currentFilter?.priceMin = min
        case let .maxPrice(_, max):
            self.currentFilter?.priceMax = max
        case let .minAreaSquareMeter(value):
            break
        case let .maxAreaSquareMeter(value):
            break
        }
    }

    private var sections: [FilterViewModel.Section] {
        guard let currentFilter else { return [] }
        let apperanceTypeProperty: FilterViewModel.Apperance = .picker([
            .appartment(currentFilter.property.type == .appartment),
            .house(currentFilter.property.type == .house),
            .both(currentFilter.property.type == .both)
        ])
        let cellsTypeProperty = [
            FilterViewModel.Cell(apperance: apperanceTypeProperty)
        ]
        let sectionTypeProperty = FilterViewModel.Section(headerApperance: .typeProperty,
                                                          cells: cellsTypeProperty)

        let cellsNumberOfRoom = [
            FilterViewModel.Cell(apperance: .toggle(.studio(currentFilter.studio))),
            FilterViewModel.Cell(apperance: .toggle(.two(currentFilter.twoRoom))),
            FilterViewModel.Cell(apperance: .toggle(.three(currentFilter.threeRoom))),
            FilterViewModel.Cell(apperance: .toggle(.four(currentFilter.fourRoom))),
            FilterViewModel.Cell(apperance: .toggle(.fiveOrMore(currentFilter.fiveOrMoreRoom)))
        ]
        let sectionNumberOfRoom = FilterViewModel.Section(headerApperance: .numberOfRoom,
                                                               cells: cellsNumberOfRoom)

        let cellsNumberOfBedRoom = [
            FilterViewModel.Cell(apperance: .toggle(.oneBedroom(currentFilter.oneBedRoom, isDisabled: isDisabled(with: .oneBedroom(currentFilter.oneBedRoom))))),
            FilterViewModel.Cell(apperance: .toggle(.twoBedroom(currentFilter.twoBedRoom, isDisabled: isDisabled(with: .twoBedroom(currentFilter.twoRoom))))),
            FilterViewModel.Cell(apperance: .toggle(.threeBedroom(currentFilter.threeBedRoom, isDisabled: isDisabled(with: .threeBedroom(currentFilter.threeRoom))))),
            FilterViewModel.Cell(apperance: .toggle(.fourBedroom(currentFilter.fourBedRoom, isDisabled: isDisabled(with: .fourBedroom(currentFilter.fourRoom))))),
            FilterViewModel.Cell(apperance: .toggle(.fiveOrMoreBedroom(currentFilter.fiveOrMoreBedRoom, isDisabled: isDisabled(with: .fiveOrMoreBedroom(currentFilter.fiveOrMoreRoom)))))
        ]
        let sectionNumberOfBedRoom = FilterViewModel.Section(headerApperance: .numberOfBedroom,
                                                             cells: cellsNumberOfBedRoom)

        let cellsPrice = [

            FilterViewModel.Cell(apperance: .textField(.minPrice(currentFilter.priceMin,
                                                                 currentFilter.priceMax))),
            FilterViewModel.Cell(apperance: .slider(.minPrice(min: currentFilter.priceMin,
                                                              max: currentFilter.priceMax))),
            FilterViewModel.Cell(apperance: .textField(.maxPrice(currentFilter.priceMin,
                                                                 currentFilter.priceMax))),
            FilterViewModel.Cell(apperance: .slider(.maxPrice(min: currentFilter.priceMin,
                                                              max: currentFilter.priceMax,
                                                              maxRange: currentFilter.maxPriceSlideRange))),
        ]
        let sectionPrice = FilterViewModel.Section(headerApperance: .price,
                                                   cells: cellsPrice)
        return [
            sectionTypeProperty,
            sectionNumberOfRoom,
            sectionNumberOfBedRoom,
            sectionPrice
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
