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
    private let userFilter = UserFilter()

    func inject(presenter: FilterPresentationLogic?) {
        self.presenter = presenter
    }
}

extension FilterInteractor: FilterBusinessLogic {
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
        case let .one(value):
            userFilter.saveValue(filter: .roomCount(.oneRoom, value))
        case let .two(value):
            userFilter.saveValue(filter: .roomCount(.twoRoom, value))
        case let .three(value):
            userFilter.saveValue(filter: .roomCount(.threeRoom, value))
        case let .four(value):
            userFilter.saveValue(filter: .roomCount(.fourRoom, value))
        case let .fiveOrMore(value):
            userFilter.saveValue(filter: .roomCount(.fiveOrMoreRoom, value))
        }
//        presenter?.updateItem(with: item)
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

        return FilterContent(property: typeProperty,
                             studio: studio,
                             oneRoom: oneRoom,
                             twoRoom: twoRoom,
                             threeRoom: threeRoom,
                             fourRoom: fourRoom,
                             fiveOrMoreRoom: fiveOrMoreRoom,
                             priceMin: 100000,
                             priceMax: 200000)
    }
}
