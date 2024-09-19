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
    private let userFilter = UserFilter()

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
            userFilter.saveValue(filter: .propertyType(.appartment))
        case .house:
            userFilter.saveValue(filter: .propertyType(.house))
        case .both:
            userFilter.saveValue(filter: .propertyType(.both))
        case let .studio(value):
            userFilter.saveValue(filter: .roomCount(.studio, value))
            presenter?.updateItem(with: item)
        case let .one(value):
            userFilter.saveValue(filter: .roomCount(.oneRoom, value))
            presenter?.updateItem(with: item)
        case let .two(value):
            userFilter.saveValue(filter: .roomCount(.twoRoom, value))
            presenter?.updateItem(with: item)
        case let .three(value):
            userFilter.saveValue(filter: .roomCount(.threeRoom, value))
            presenter?.updateItem(with: item)
        case let .four(value):
            userFilter.saveValue(filter: .roomCount(.fourRoom, value))
            presenter?.updateItem(with: item)
        case let .fiveOrMore(value):
            userFilter.saveValue(filter: .roomCount(.fiveOrMoreRoom, value))
            presenter?.updateItem(with: item)
        case let .priceSlider(min, max):
            if min >= max {
                presenter?.updateItem(with: .priceSlider(min, min + 20000))
            } else {
                presenter?.updateItem(with: .priceSlider(min, max))
            }
        case let .areaSquareSlider(min, max):
            if min >= max {
                presenter?.updateItem(with: .areaSquareSlider(min, min + 5))
            } else {
                presenter?.updateItem(with: .areaSquareSlider(min, max))
            }
        case let .oneBedroom(value):
            userFilter.saveValue(filter: .bedroomCount(.oneBedroom, value))
            presenter?.updateItem(with: item)
        case let .twoBedroom(value):
            userFilter.saveValue(filter: .bedroomCount(.twoBedroom, value))
            presenter?.updateItem(with: item)
        case let .threeBedroom(value):
            userFilter.saveValue(filter: .bedroomCount(.threeRoom, value))
            presenter?.updateItem(with: item)
        case let .fourBedroom(value):
            userFilter.saveValue(filter: .bedroomCount(.fourBedroom, value))
            presenter?.updateItem(with: item)
        case let .fiveOrMoreBedroom(value):
            userFilter.saveValue(filter: .bedroomCount(.fiveOrMoreBedroom, value))
            presenter?.updateItem(with: item)
        case let .localisationDistance(value):
            userFilter.saveValue(filter: .localisationDistance(.localisationDistance, value))
            presenter?.updateItem(with: item)
        case let .buildBefore1950(value):
            userFilter.saveValue(filter: .buildYear(.buildBefore1950, value))
            presenter?.updateItem(with: item)
        case let .buildBetwen1950And2000(value):
            userFilter.saveValue(filter: .buildYear(.buildBetwen1950And2000, value))
            presenter?.updateItem(with: item)
        case let .buildAfter2000(value):
            userFilter.saveValue(filter: .buildYear(.buildAfter2000, value))
            presenter?.updateItem(with: item)
        case let .a(value):
            userFilter.saveValue(filter: .energyPerformance(.energyA, value))
            presenter?.updateItem(with: item)
        case let .b(value):
            userFilter.saveValue(filter: .energyPerformance(.energyB, value))
            presenter?.updateItem(with: item)
        case let .c(value):
            userFilter.saveValue(filter: .energyPerformance(.energyC, value))
            presenter?.updateItem(with: item)
        case let .d(value):
            userFilter.saveValue(filter: .energyPerformance(.energyD, value))
            presenter?.updateItem(with: item)
        case let .e(value):
            userFilter.saveValue(filter: .energyPerformance(.energyE, value))
            presenter?.updateItem(with: item)
        case let .f(value):
            userFilter.saveValue(filter: .energyPerformance(.energyF, value))
            presenter?.updateItem(with: item)
        case let .g(value):
            userFilter.saveValue(filter: .energyPerformance(.energyG, value))
            presenter?.updateItem(with: item)
        default:
            presenter?.updateItem(with: item)
        }
    }
}

extension FilterInteractor {
    private func createContent() -> FilterContent {
        let typeProperty = FilterContent.Property(type: userFilter.getProperty())
        let studio = userFilter.studio
        let oneRoom = userFilter.oneRoom
        let twoRoom = userFilter.twoRoom
        let threeRoom = userFilter.threeRoom
        let fourRoom = userFilter.fourRoom
        let fiveOrMoreRoom = userFilter.fiveOrMoreRoom

        let oneBedRoom = userFilter.oneBedRoom
        let twoBedRoom = userFilter.twoBedRoom
        let threeBedRoom = userFilter.threeBedRoom
        let fourBedRoom = userFilter.fourBedRoom
        let fiveOrMoreBedRoom = userFilter.fiveOrMoreBedRoom

        let localisationDistance = userFilter.localisationDistance

        let buildBefore1950 = userFilter.buildBefore1950
        let buildBetwen1950And2000 = userFilter.buildBetwen1950And2000
        let buildAfter2000 = userFilter.buildAfter2000

        let energyA = userFilter.energyA
        let energyB = userFilter.energyB
        let energyC = userFilter.energyC
        let energyD = userFilter.energyD
        let energyE = userFilter.energyE
        let energyF = userFilter.energyF
        let energyG = userFilter.energyG

        let content = FilterContent(order: FilterContent.Order(type: .orderPriceAsc),
                                    property: typeProperty,
                                    studio: studio,
                                    oneRoom: oneRoom,
                                    twoRoom: twoRoom,
                                    threeRoom: threeRoom,
                                    fourRoom: fourRoom,
                                    fiveOrMoreRoom: fiveOrMoreRoom,
                                    priceMin: 100,
                                    priceMax: 200000,
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
                                    minAreaSquareMeter: 0,
                                    maxAreaSquareMeter: 50,
                                    a: energyA,
                                    b: energyB,
                                    c: energyC,
                                    d: energyD,
                                    e: energyE,
                                    f: energyF,
                                    g: energyG)
        self.content = content
        return content
    }
}
