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
            if min >= max {
                presenter?.updateItem(with: .minPrice(max - 50000, max))
            } else {
                presenter?.updateItem(with: item)
            }
        case let .maxPrice(min, max):
            if max >= content.maxPriceSlideRange {
                presenter?.updateItem(with: .maxPrice(min, content.maxPriceSlideRange - 50000))
            } else if max <= min {
                presenter?.updateItem(with: .maxPrice(min, min + 50000))
            } else {
                presenter?.updateItem(with: item)
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
                                    maxPriceSlideRange: 10000000,
                                    oneBedRoom: false,
                                    twoBedRoom: false,
                                    threeBedRoom: false,
                                    fourBedRoom: false,
                                    fiveOrMoreBedRoom: false)
        self.content = content
        return content
    }
}
