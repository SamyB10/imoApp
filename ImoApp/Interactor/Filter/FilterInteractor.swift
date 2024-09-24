//
//  FilterInteractor.swift
//  ImoApp
//
//  Created by Boussair Samy on 22/08/2024.
//

import Foundation

protocol FilterBusinessLogic {
    func didLoad() async
    func didSelectItem(with item: SelectedFilterItem)
}

final class FilterInteractor {
    private var presenter: FilterPresentationLogic?
    private var content: FilterContent?
    private let userFilter = FilterRepository()

    func inject(presenter: FilterPresentationLogic?) {
        self.presenter = presenter
    }
}

extension FilterInteractor: FilterBusinessLogic {
    @MainActor
    func didLoad() {
        let content = createContent()
        presenter?.presentInterface(with: content)
    }

    func didSelectItem(with item: SelectedFilterItem) {
        switch item {
        case .appartment:
            userFilter.updatePropertyType(with: .appartment)
        case .house:
            userFilter.updatePropertyType(with: .house)
        case .both:
            userFilter.updatePropertyType(with: .both)
        case let .studio(value):
            userFilter.updateStudio(with: value)
            presenter?.updateItem(with: item)
        case let .one(value):
            userFilter.updateStudio(with: value)
            presenter?.updateItem(with: item)
        case let .two(value):
            userFilter.updateTwoRoom(with: value)
            presenter?.updateItem(with: item)
        case let .three(value):
            userFilter.updateThreeRoom(with: value)
            presenter?.updateItem(with: item)
        case let .four(value):
            userFilter.updateFourRoom(with: value)
            presenter?.updateItem(with: item)
        case let .fiveOrMore(value):
            userFilter.updateFiveOrMoreRoom(with: value)
            presenter?.updateItem(with: item)
        case let .priceSlider(min, max):
            let newMin: Int
            let newMax: Int
            if min >= max {
                newMin = min
                newMax = min + 20000
            } else {
                newMin = min
                newMax = max
            }
            userFilter.updatePrice(newMin, newMax)
            presenter?.updateItem(with: .priceSlider(newMin, newMax))
        case let .areaSquareSlider(min, max):
            let newMin: Int
            let newMax: Int
            if min >= max {
                newMin = min
                newMax = min + 5
            } else {
                newMin = min
                newMax = max
            }
            userFilter.updateAreaSquare(newMin, newMax)
            presenter?.updateItem(with: .areaSquareSlider(newMin, newMax))
        case let .oneBedroom(value):
            userFilter.updateOneBedRoom(with: value)
            presenter?.updateItem(with: item)
        case let .twoBedroom(value):
            userFilter.updateTwoBedRoom(with: value)
            presenter?.updateItem(with: item)
        case let .threeBedroom(value):
            userFilter.updateThreeBedRoom(with: value)
            presenter?.updateItem(with: item)
        case let .fourBedroom(value):
            userFilter.updateFourBedRoom(with: value)
            presenter?.updateItem(with: item)
        case let .fiveOrMoreBedroom(value):
            userFilter.updateFiveOrMoreBedRoom(with: value)
            presenter?.updateItem(with: item)
        case let .localisationDistance(value):
            userFilter.updateLocalisationDistance(with: value)
            presenter?.updateItem(with: item)
        case let .buildBefore1950(value):
            userFilter.updateBuildYears(with: .buildBefore1950(value))
            presenter?.updateItem(with: item)
        case let .buildBetwen1950And2000(value):
            userFilter.updateBuildYears(with: .buildBetwen1950And2000(value))
            presenter?.updateItem(with: item)
        case let .buildAfter2000(value):
            userFilter.updateBuildYears(with: .buildAfter2000(value))
            presenter?.updateItem(with: item)
        case let .a(value):
            userFilter.updateEneryPerformance(with: .eneryPerformanceA(value))
            presenter?.updateItem(with: item)
        case let .b(value):
            userFilter.updateEneryPerformance(with: .eneryPerformanceB(value))
            presenter?.updateItem(with: item)
        case let .c(value):
            userFilter.updateEneryPerformance(with: .eneryPerformanceC(value))
            presenter?.updateItem(with: item)
        case let .d(value):
            userFilter.updateEneryPerformance(with: .eneryPerformanceD(value))
            presenter?.updateItem(with: item)
        case let .e(value):
            userFilter.updateEneryPerformance(with: .eneryPerformanceE(value))
            presenter?.updateItem(with: item)
        case let .f(value):
            userFilter.updateEneryPerformance(with: .eneryPerformanceF(value))
            presenter?.updateItem(with: item)
        case let .g(value):
            userFilter.updateEneryPerformance(with: .eneryPerformanceG(value))
            presenter?.updateItem(with: item)
        default:
            presenter?.updateItem(with: item)
        }
    }
}

extension FilterInteractor {
    private func createContent() -> FilterContent {

        let studio = userFilter.studio
        let twoRoom = userFilter.twoRoom
        let threeRoom = userFilter.threeRoom
        let fourRoom = userFilter.fourRoom
        let fiveOrMoreRoom = userFilter.fiveOrMoreRoom

        let oneBedRoom = userFilter.oneBedroom
        let twoBedRoom = userFilter.twoBedroom
        let threeBedRoom = userFilter.threeBedroom
        let fourBedRoom = userFilter.fourBedroom
        let fiveOrMoreBedRoom = userFilter.fiveOrMoreBedroom

        let buildBefore1950 = userFilter.buildBefore1950
        let buildBetwen1950And2000 = userFilter.buildBetwen1950And2000
        let buildAfter2000 = userFilter.buildAfter2000

        let eneryPerformanceA = userFilter.eneryPerformanceA
        let eneryPerformanceB = userFilter.eneryPerformanceB
        let eneryPerformanceC = userFilter.eneryPerformanceC
        let eneryPerformanceD = userFilter.eneryPerformanceD
        let eneryPerformanceE = userFilter.eneryPerformanceE
        let eneryPerformanceF = userFilter.eneryPerformanceF
        let eneryPerformanceG = userFilter.eneryPerformanceG

        let priceMin = userFilter.priceMin
        let priceMax = userFilter.priceMax

        let areaSquareMin = userFilter.areaSquareMin
        let areaSquareMax = userFilter.areaSquareMax

        let localisationDistance = userFilter.localisationDistance

        let selectedPropertyType = userFilter.selectedPropertyType
        var property: FilterContent.Property {
            switch selectedPropertyType {
            case .house:
                FilterContent.Property(type: .house)
            case .both:
                FilterContent.Property(type: .both)
            case .appartment:
                FilterContent.Property(type: .appartment)
            }
        }

        let content = FilterContent(order: FilterContent.Order(type: .orderPriceAsc),
                                    property: property,
                                    studio: studio,
                                    oneRoom: studio,
                                    twoRoom: twoRoom,
                                    threeRoom: threeRoom,
                                    fourRoom: fourRoom,
                                    fiveOrMoreRoom: fiveOrMoreRoom,
                                    priceMin: priceMin,
                                    priceMax: priceMax,
                                    maxPriceSlideRange: 1000000,
                                    oneBedRoom: oneBedRoom,
                                    twoBedRoom: twoBedRoom,
                                    threeBedRoom: threeBedRoom,
                                    fourBedRoom: fourBedRoom,
                                    fiveOrMoreBedRoom: fiveOrMoreBedRoom,
                                    localisation: localisationDistance,
                                    buildBefore1950: buildBefore1950,
                                    buildBetwen1950And2000: buildBetwen1950And2000,
                                    buildAfter2000: buildAfter2000,
                                    minAreaSquareMeter: areaSquareMin,
                                    maxAreaSquareMeter: areaSquareMax,
                                    a: eneryPerformanceA,
                                    b: eneryPerformanceB,
                                    c: eneryPerformanceC,
                                    d: eneryPerformanceD,
                                    e: eneryPerformanceE,
                                    f: eneryPerformanceF,
                                    g: eneryPerformanceG)
        self.content = content
        return content
    }
}
