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
        case let .minPrice(min, max):
            self.currentFilter?.priceMin = min
            self.currentFilter?.priceMax = max
        case let .maxPrice(_, max):
            self.currentFilter?.priceMax = max
        case let .minAreaSquareMeter(value):
            self.currentFilter?.minAreaSquareMeter = value
        case let .maxAreaSquareMeter(value):
            self.currentFilter?.maxAreaSquareMeter = value
        case let .localisation(localisation):
            self.currentFilter?.localisation = localisation
        case let .buildBefore1950(state):
            self.currentFilter?.buildBefore1950 = state
        case let .buildBetwen1950And2000(state):
            self.currentFilter?.buildBetwen1950And2000 = state
        case let .buildAfter2000(state):
            self.currentFilter?.buildAfter2000 = state
        case let .priceSlider(min, max):
            self.currentFilter?.priceMin = min
            self.currentFilter?.priceMax = max
        case let .areaSquareSlider(min, max):
            self.currentFilter?.minAreaSquareMeter = min
            self.currentFilter?.maxAreaSquareMeter = max
        case let .a(value):
            self.currentFilter?.a = value
        case let .b(value):
            self.currentFilter?.b = value
        case let .c(value):
            self.currentFilter?.c = value
        case let .d(value):
            self.currentFilter?.d = value
        case let .e(value):
            self.currentFilter?.e = value
        case let .f(value):
            self.currentFilter?.f = value
        case let .g(value):
            self.currentFilter?.g = value
        case .orderPerDateAsc:
            self.currentFilter?.order = FilterContent.Order(type: .orderPerDateAsc)
        case .orderPerDateDesc:
            self.currentFilter?.order = FilterContent.Order(type: .orderPerDateDesc)
        case .orderPricePerMeterAsc:
            self.currentFilter?.order = FilterContent.Order(type: .orderPricePerMeterAsc)
        case .orderPricePerMeterDesc:
            self.currentFilter?.order = FilterContent.Order(type: .orderPricePerMeterDesc)
        case .orderPriceAsc:
            self.currentFilter?.order = FilterContent.Order(type: .orderPriceAsc)
        case .orderPriceDesc:
            self.currentFilter?.order = FilterContent.Order(type: .orderPriceDesc)
        case .orderSurfaceAsc:
            self.currentFilter?.order = FilterContent.Order(type: .orderSurfaceAsc)
        case .orderSurfaceDesc:
            self.currentFilter?.order = FilterContent.Order(type: .orderSurfaceDesc)
        }
    }

    private var sections: [FilterViewModel.Section] {
        guard let currentFilter else { return [] }
        let appearanceTypeProperty: FilterViewModel.Appearance = .picker([
            .appartment(currentFilter.property.type == .appartment),
            .house(currentFilter.property.type == .house),
            .both(currentFilter.property.type == .both),
        ])
        let cellsTypeProperty = [
            FilterViewModel.Cell(appearance: appearanceTypeProperty)
        ]
        let sectionTypeProperty = FilterViewModel.Section(headerApperance: .typeProperty,
                                                          cells: cellsTypeProperty)

        let cellsNumberOfRoom = [
            FilterViewModel.Cell(appearance: .toggle(.studio(currentFilter.studio))),
            FilterViewModel.Cell(appearance: .toggle(.two(currentFilter.twoRoom))),
            FilterViewModel.Cell(appearance: .toggle(.three(currentFilter.threeRoom))),
            FilterViewModel.Cell(appearance: .toggle(.four(currentFilter.fourRoom))),
            FilterViewModel.Cell(appearance: .toggle(.fiveOrMore(currentFilter.fiveOrMoreRoom)))
        ]
        let sectionNumberOfRoom = FilterViewModel.Section(headerApperance: .numberOfRoom,
                                                               cells: cellsNumberOfRoom)

        let cellsNumberOfBedRoom = [
            FilterViewModel.Cell(appearance: .toggle(.oneBedroom(currentFilter.oneBedRoom, isDisabled: isDisabled(with: .oneBedroom(currentFilter.oneBedRoom))))),
            FilterViewModel.Cell(appearance: .toggle(.twoBedroom(currentFilter.twoBedRoom, isDisabled: isDisabled(with: .twoBedroom(currentFilter.twoRoom))))),
            FilterViewModel.Cell(appearance: .toggle(.threeBedroom(currentFilter.threeBedRoom, isDisabled: isDisabled(with: .threeBedroom(currentFilter.threeRoom))))),
            FilterViewModel.Cell(appearance: .toggle(.fourBedroom(currentFilter.fourBedRoom, isDisabled: isDisabled(with: .fourBedroom(currentFilter.fourRoom))))),
            FilterViewModel.Cell(appearance: .toggle(.fiveOrMoreBedroom(currentFilter.fiveOrMoreBedRoom, isDisabled: isDisabled(with: .fiveOrMoreBedroom(currentFilter.fiveOrMoreRoom)))))
        ]
        let sectionNumberOfBedRoom = FilterViewModel.Section(headerApperance: .numberOfBedroom,
                                                             cells: cellsNumberOfBedRoom)

        let cellsPrice = [
            FilterViewModel.Cell(appearance: .slider(.price(min: currentFilter.priceMin,
                                                           max: currentFilter.priceMax)))
        ]

        let sectionPrice = FilterViewModel.Section(headerApperance: .price,
                                                   cells: cellsPrice)

        let cellsAreaSquareMeter = [
            FilterViewModel.Cell(appearance: .slider(.areaSquareMeter(min: currentFilter.minAreaSquareMeter,
                                                                     max: currentFilter.maxAreaSquareMeter)))
        ]
        let sectionAreaSquareMeter = FilterViewModel.Section(headerApperance: .areaSquareMeter,
                                                             cells: cellsAreaSquareMeter)

        let cellsBuildYear = [
            FilterViewModel.Cell(appearance: .toggle(.buildBefore1950(currentFilter.buildBefore1950))),
            FilterViewModel.Cell(appearance: .toggle(.buildBetwen1950And2000(currentFilter.buildBetwen1950And2000))),
            FilterViewModel.Cell(appearance: .toggle(.buildAfter2000(currentFilter.buildAfter2000)))
        ]
        let sectionBuildYear = FilterViewModel.Section(headerApperance: .builYear,
                                                       cells: cellsBuildYear)

        let cellsLocalisation = [
            FilterViewModel.Cell(appearance: .slider(.localisation(range: currentFilter.localisation)))
        ]
        let sectionLocalisation = FilterViewModel.Section(headerApperance: .localisation,
                                                          cells: cellsLocalisation)

        let cellsEnergyPerformance = [
            FilterViewModel.Cell(appearance: .toggle(.a(currentFilter.a))),
            FilterViewModel.Cell(appearance: .toggle(.b(currentFilter.b))),
            FilterViewModel.Cell(appearance: .toggle(.c(currentFilter.c))),
            FilterViewModel.Cell(appearance: .toggle(.d(currentFilter.d))),
            FilterViewModel.Cell(appearance: .toggle(.e(currentFilter.e))),
            FilterViewModel.Cell(appearance: .toggle(.f(currentFilter.f))),
            FilterViewModel.Cell(appearance: .toggle(.g(currentFilter.g))),
        ]
        let sectionEnergyPerformance = FilterViewModel.Section(headerApperance: .enery,
                                                               cells: cellsEnergyPerformance)
        return [
            sectionTypeProperty,
            sectionNumberOfRoom,
            sectionNumberOfBedRoom,
            sectionPrice,
            sectionAreaSquareMeter,
            sectionLocalisation,
            sectionBuildYear,
            sectionEnergyPerformance
        ]
    }

    private var menuItemFilter: FilterViewModel.MenuItemFilter {
        guard let currentFilter else { return FilterViewModel.MenuItemFilter(section: []) }
        let cellsOrder = [
            FilterViewModel.Order.orderPriceAsc(currentFilter.order.type == .orderPriceAsc),
            FilterViewModel.Order.orderPriceDesc(currentFilter.order.type == .orderPriceDesc),
            FilterViewModel.Order.orderPerDateAsc(currentFilter.order.type == .orderPerDateAsc),
            FilterViewModel.Order.orderPerDateDesc(currentFilter.order.type == .orderPerDateDesc),
            FilterViewModel.Order.orderSurfaceAsc(currentFilter.order.type == .orderSurfaceAsc),
            FilterViewModel.Order.orderSurfaceDesc(currentFilter.order.type == .orderSurfaceDesc),
            FilterViewModel.Order.orderPricePerMeterAsc(currentFilter.order.type == .orderPricePerMeterAsc),
            FilterViewModel.Order.orderPricePerMeterDesc(currentFilter.order.type == .orderPricePerMeterDesc),
        ]

        let sectionMenuFilter = [
            FilterViewModel.SectionMenuFilter(order: cellsOrder)
        ]

        return FilterViewModel.MenuItemFilter(section: sectionMenuFilter)
    }

    var viewModel: FilterViewModel {
        FilterViewModel(sections: sections,
                        menuItemFilter: menuItemFilter)
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
