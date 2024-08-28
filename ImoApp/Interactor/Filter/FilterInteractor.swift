//
//  FilterInteractor.swift
//  ImoApp
//
//  Created by Boussair Samy on 22/08/2024.
//

import Foundation
protocol FilterBusinessLogic {
    func didLoad()
    func didSelectItemPicker(with item: SelectedFilterItem)
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
        presenter?.presentInterface(with: createContent())
    }

    func didSelectItemPicker(with item: SelectedFilterItem) {
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
        presenter?.updateItem(with: item)
    }
}

extension FilterInteractor {
    private func createContent() -> FilterContent {
        let typeProperty = FilterContent.Property(type: userFilter.getProperty())
        let getUserFilterNumberOfRoom = userFilter.getNumberOfRoom()
        let numberOfRoom = FilterContent.NumberOfRoom(studio: getUserFilterNumberOfRoom.studio,
                                                      one: getUserFilterNumberOfRoom.one,
                                                      two: getUserFilterNumberOfRoom.two,
                                                      three: getUserFilterNumberOfRoom.three,
                                                      four: getUserFilterNumberOfRoom.four,
                                                      fiveOrMore: getUserFilterNumberOfRoom.fiveOrMore)
        return FilterContent(property: typeProperty,
                             numberOfRoom: numberOfRoom)
    }
}
