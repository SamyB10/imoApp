//
//  FilterInteractor.swift
//  ImoApp
//
//  Created by Boussair Samy on 22/08/2024.
//

import Foundation

protocol FilterBusinessLogic {
    func didLoad()
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

    @MainActor
    func didSelectItem(with item: SelectedFilterItem) {
        guard let content else { return }
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
        case let .minPrice(min, max):
            presenter?.updateItem(with: item)
        case let .maxPrice(min, max):
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
        default:
            print("faire le didSelect")
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

        let content = FilterContent(property: typeProperty,
                                    studio: studio,
                                    oneRoom: oneRoom,
                                    twoRoom: twoRoom,
                                    threeRoom: threeRoom,
                                    fourRoom: fourRoom,
                                    fiveOrMoreRoom: fiveOrMoreRoom,
                                    priceMin: 100,
                                    priceMax: 200000,
                                    maxPriceSlideRange: 1000000,
                                    oneBedRoom: false,
                                    twoBedRoom: false,
                                    threeBedRoom: false,
                                    fourBedRoom: false,
                                    fiveOrMoreBedRoom: false,
                                    localisation: 10,
                                    buildBefore1950: false,
                                    buildBetwen1950And2000: false,
                                    buildAfter2000: false,
                                    minAreaSquareMeter: 0,
                                    maxAreaSquareMeter: 50,
                                    minAreaSquareMeterField: 0,
                                    maxAreaSquareMeterField: 0)
        self.content = content
        return content
    }
}
